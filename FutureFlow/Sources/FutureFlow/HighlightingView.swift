//
//  HighlightingView.swift
//  
//
//  Created by Muhand Jumah on 4/23/23.
//

import SwiftUI

public final class Manager<Chunk: FlowChunk>: ObservableObject {
    @Published var totalChunks: [Chunk] = []
    @Published var currentStepIndex: Int = 0
}

internal struct HighlightingView<Content: View, Chunk: FlowChunk>: View {
    @StateObject var manager: Manager<Chunk> = .init()

    // Binding variables
    @Binding var showTutorial: Bool

    // Private variables
    let namespace: Namespace.ID
    let chunks: [Chunk]
    let content: () -> Content

    #if DEBUG
    // State variables (TODO: Delete)
    @State private var currentIndex: Int = 0
    #endif

    @Namespace private var namespace2

    private var onCurrentChunkChanged: ((_ newChunk: Chunk) -> ())?

    internal init(
        namespace: Namespace.ID,
        showTutorial: Binding<Bool>,
        chunks: [Chunk],
        @ViewBuilder content: @escaping () -> Content)
    {
        self.namespace = namespace
        self._showTutorial = showTutorial
        self.chunks = chunks
        self.onCurrentChunkChanged = nil
        self.content = content
    }

    fileprivate init(
        namespace: Namespace.ID,
        showTutorial: Binding<Bool>,
        chunks: [Chunk],
        onCurrentChunkChanged: @escaping (_ chunk: Chunk) -> (),
        content: @escaping () -> Content)
    {
        self.namespace = namespace
        self._showTutorial = showTutorial
        self.chunks = chunks
        self.onCurrentChunkChanged = onCurrentChunkChanged
        self.content = content
    }

    internal var body: some View {
        ZStack {
            self.content()

            ZStack {
                if (self.showTutorial) {
                    let chunk = self.chunks[self.currentIndex]

                    SpotlightView(
                        chunk: chunk,
                        namespace: self.namespace,
                        namespace2: self.namespace2
                    )
                        .opacity(self.showTutorial ? 1 : 0)
                        .animation(.easeOut, value: self.showTutorial ? self.currentIndex : nil)


                    chunk.instructionsView(self.advance, self.previous)
                        .frame(width:UIScreen.main.bounds.width * 0.8)
                        .offset(x:0, y:self.chunks[self.currentIndex].instructionsViewPosition == .below ? 20 : -20)
                        .matchedGeometryEffect(id: 10001,
                                               in: self.namespace2,
                                               properties: .position,
                                               anchor: self.chunks[self.currentIndex].instructionsViewPosition == .below ? .top : .bottom,
                                               isSource: false)
                        .animation(.easeOut, value: self.showTutorial ? self.currentIndex : nil)
                }
            }
            .transition(.opacity)
            .animation(.linear, value: self.showTutorial)
        }
        .onChange(of: self.showTutorial) { newValue in
            if(newValue == false) {
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                    self.currentIndex = 0
                }
            }
        }
        .onChange(of: self.currentIndex) { newValue in
            if let callback = self.onCurrentChunkChanged {
                callback(self.chunks[newValue])
            }
        }
    }

    func onStepChange(_ callback: @escaping (_ chunk: Chunk) -> ()) -> HighlightingView {
        .init(namespace: self.namespace,
              showTutorial: self.$showTutorial,
              chunks: self.chunks,
              onCurrentChunkChanged: callback,
              content: self.content)
    }
}

private extension HighlightingView {
    func advance() {
        if self.currentIndex < self.chunks.count - 1{
            self.currentIndex += 1
            return
        }

        self.showTutorial = false
    }

    func previous() {
        if self.currentIndex > 0 {
            self.currentIndex -= 1
        }
    }
}
