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


            self.chunk.spotlightShape.body(self.namespace)
                .blendMode(.destinationOut)
                .matchedGeometryEffect(
                    id: 10001,
                    in: self.namespace2,
                    properties: .position,
                    anchor: self.chunk.instructionsViewPosition == .above ? .top : .bottom,
                    isSource: true
                )

                .matchedGeometryEffect(
                    id: self.chunk.id,
                    in: namespace,
                    properties: .frame,
                    anchor: .center,
                    isSource: false
                )
        }
        .compositingGroup()
    }
}
