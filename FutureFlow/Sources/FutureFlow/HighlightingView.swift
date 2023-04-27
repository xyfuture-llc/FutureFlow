//
//  HighlightingView.swift
//  
//
//  Created by Muhand Jumah on 4/23/23.
//

import SwiftUI

internal struct HighlightingView<Content: View, Chunk: FlowChunk>: View {
    // Binding variables
    @Binding var showTutorial: Bool

    // Private variables
    let namespace: Namespace.ID
    let chunks: [Chunk]
    let content: Content

    #if DEBUG
    // State variables (TODO: Delete)
    @State private var currentIndex: Int = 0
    #endif

    @Namespace private var namespace2

    internal init(namespace: Namespace.ID, showTutorial: Binding<Bool>, chunks: [Chunk], @ViewBuilder content: () -> Content) {
        self.namespace = namespace
        self._showTutorial = showTutorial
        self.chunks = chunks
        self.content = content()
    }

    internal var body: some View {
        ZStack {
            self.content

            SpotlightView(
                chunk: self.chunks[self.currentIndex],
                namespace: self.namespace,
                namespace2: self.namespace2
            )
            .opacity(self.showTutorial ? 1 : 0)
            .animation(
                .easeOut,
                value: self.showTutorial ? self.currentIndex : nil
            )
            .overlay(
                GeometryReader { reader in
                    instructionsOverlay(reader: reader)
                        .animation(.easeOut, value: self.showTutorial ? self.currentIndex : nil)
//                    Text("\(reader.size.width) X \(reader.size.height)")
//                    ZStack {
//                        Color.blue
//                    }
                }
                    .matchedGeometryEffect(id: 10000, in: self.namespace2, isSource: false)
//                    .overlay(
//                        GeometryReader { reader in
//                            Text("\(reader.size.width) X \(reader.size.height)")
//                        }
//                    )
            )
            

//#if DEBUG
//            Button(action: {
//                if self.currentIndex < self.chunks.count - 1{
//                    self.currentIndex += 1
//                } else {
//                    self.currentIndex = 0
//                }
//            }) {
//                Text("NEXT")
//            }
//#endif
        }
    }
}

private extension HighlightingView {
    func advance() {
        if self.currentIndex < self.chunks.count - 1{
            self.currentIndex += 1
        }
    }

    func previous() {
        if self.currentIndex > 0 {
            self.currentIndex -= 1
        }
    }

    @ViewBuilder func instructionsOverlay(reader: GeometryProxy) -> some View {
        if let instructionsViewType = self.chunks[self.currentIndex].instructionsViewType {
            let v = instructionsViewType
                .body(
                    currentIndex: self.$currentIndex,
                    maxCount: self.chunks.count,
                    advance: self.advance,
                    previous: self.previous
                )
            ZStack {
                // TODO: Find a better way than this hacky method
                v
                    .opacity(0)
            }
            .overlay(
                GeometryReader { rr in
                    v
                        .frame(width: UIScreen.main.bounds.size.width)
                        .offset(
                            x: -(UIScreen.main.bounds.size.width - reader.size.width) / 2,
                            y: self.getYOffset(position: v.position, in: v.position == .below ? reader.size : rr.size)
                        )
                }

            )
//            v
//                .overlay(
//                    Text("\(reader.size.height)").allowsHitTesting(false))

//                .offset(
//                    x: -(UIScreen.main.bounds.size.width - reader.size.width) / 2,
//                    y: self.getYOffset(position: v.position, in: reader.size)
//                )

//                    y: self.getYOffset(position: v.position, in: reader.size)
//                )
        }
//        ZStack {

//            if let sle

//            if(self.chunks[self.currentIndex].instruction != nil) {
//                SimpleInstructionsBubble(text: "TEST")
//                    .frame(width: 200, height: 100, alignment: .center)
//                self.chunks[self.currentIndex].instruction!.bubble.body(instruction: self.chunks[self.currentIndex].instruction!)
//            }
//                .offset(x: 0, y: reader.size.height + 20)

//            if let instruction = self.chunks[self.currentIndex].instruction {
//            self
//                .chunks[self.currentIndex]
//                .instructionsViewType!
////                .inWithEnum()
//                .body(adv: self.advance, prev: self.previous)
//                .instructionsView(advance: self.advance, previous: self.previous)
//                instruction.bubble.body(instruction: instruction)
//                    .padding(.horizontal, 15)
//                    .frame(width: UIScreen.main.bounds.size.width)
////                    .offset(x: 0, y: 400)
//                    .offset(
//                        x: -(UIScreen.main.bounds.size.width - reader.size.width) / 2,
//                        y: self.getYOffset(position: instruction.position, in: reader.size)
//                    )
//            }

//            if (self.chunk.instructionsBubble != nil) {
//                self.chunk.instructionsBubble!.body
//                    .padding(.horizontal)
//                    .frame(width: UIScreen.main.bounds.size.width)
//                    .offset(x: 0, y: self.getYOffset(position: self.chunk.instructionsBubble!.position, in: reader.size))
//            }
//        }
    }

    func getYOffset(position: InstructionsViewPosition, in frame: CGSize) -> CGFloat {
        switch position {
        case .above:
            return -(frame.height + 20)
        default:
            return (frame.height + 20)
        }
    }
}
