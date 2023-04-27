//
//  ContentView.swift
//  FutureFlowDemo
//
//  Created by Muhand Jumah on 4/21/23.
//

import SwiftUI
import FutureFlow


enum TutorialChunks: FlowChunk, CaseIterable {
    case red
    case green
    case yellow

    var spotlightShape: SpotlightShape {
        switch self {
        case .yellow:
            return .circle()
        default:
            return .rectangle()
        }
    }

    var spotlightBackground: SpotlightBackground {
        switch self {
        case .green:
            return .ultraThinMaterial
        default:
            return .black
        }
    }

    var instructionsViewType: InstructionsViewType? {
        switch self {
        case .red:
            return .simple(instructions: ["Text1"], position: .below)
        case .green:
            return .simple(instructions: ["Text2", "Text22", "Text222", "Text2222"], position: .below)
        case .yellow:
            return .simple(instructions: ["Text3"], position: .above)
        }
    }
}

struct ContentView: View {
    private var uniqueIdentifier: String = UUID().uuidString
    private var tutorial: [TutorialChunks] =
    [
        .red,
        .green,
        .yellow
    ]
    @State private var showTutorial: Bool = true

    var body: some View {
        VStack(spacing: 50) {
            Rectangle()
                .frame(width: 256, height: 256, alignment: .center)
                .foregroundColor(Color.red)
                .configureChunkForSpotlight(
                    parentIdentifier: self.uniqueIdentifier,
                    chunk: self.tutorial[0]
                )

            Rectangle()
                .frame(width: 64, height: 128, alignment: .center)
                .foregroundColor(Color.green)
                .configureChunkForSpotlight(
                    parentIdentifier: self.uniqueIdentifier,
                    chunk: self.tutorial[1]
                )

            Circle()
                .frame(width: 128, height: 128, alignment: .center)
                .foregroundColor(.yellow)
                .configureChunkForSpotlight(
                    parentIdentifier: self.uniqueIdentifier,
                    chunk: self.tutorial[2]
                )
                .onTapGesture {
//                    withAnimation(.linear) {
                        self.showTutorial = true
//                    }
                }
        }
        .padding()
        .assembleSpotlightChunks(uniqueIdentifier: self.uniqueIdentifier, chunks: Array(TutorialChunks.allCases), showTutorial: self.$showTutorial)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
