//
//  SpotlightView.swift
//  
//
//  Created by Muhand Jumah on 4/23/23.
//

import SwiftUI

internal struct SpotlightView<Chunk: FlowChunk>: View {
    private var chunk: Chunk
    private var namespace: Namespace.ID
    private var namespace2: Namespace.ID
    
    internal init(chunk: Chunk, namespace: Namespace.ID, namespace2: Namespace.ID) {
        self.chunk = chunk
        self.namespace = namespace
        self.namespace2 = namespace2
    }
    
    internal var body: some View {
        ZStack {
            self.chunk.spotlightBackground.body(self.namespace)
            
//            GeometryReader { reader in
                self.chunk.spotlightShape.body(self.namespace)
                    .blendMode(.destinationOut)
                    .matchedGeometryEffect(id: 10000, in: self.namespace2, isSource: true)
//                    .overlay(
//                        instructionsOverlay(reader: reader),
//                        alignment: .top
//                    )
//            }
            .matchedGeometryEffect(
                id: self.chunk.id,
                in: namespace,
                properties: .frame, anchor: .center,
                isSource: false
            )
//            .blendMode(.destinationOut)
        }
        .compositingGroup()
    }
}

// MARK: - Helper Methods
//private extension SpotlightView {
//    func instructionsOverlay(reader: GeometryProxy) -> some View {
//        ZStack {
//            if(self.chunk.instructions.count > 0) {
//                Text("TEST")
//            }
////            if (self.chunk.instructionsBubble != nil) {
////                self.chunk.instructionsBubble!.body
////                    .padding(.horizontal)
////                    .frame(width: UIScreen.main.bounds.size.width)
////                    .offset(x: 0, y: self.getYOffset(position: self.chunk.instructionsBubble!.position, in: reader.size))
////            }
//        }
//    }
//    
//    func getYOffset(position: InstructionsBubblePosition, in frame: CGSize) -> CGFloat {
//        switch position {
//        case .above:
//            return -(frame.height + 20)
//        default:
//            return (frame.height + 20)
//        }
//    }
//}
