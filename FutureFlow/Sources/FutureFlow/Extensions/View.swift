//
//  View.swift
//  
//
//  Created by Muhand Jumah on 4/23/23.
//

import SwiftUI

// MARK: - Public API for FlowChunk ONLY
public extension View {
    /// Prepares the current view to be highlighted by the spotlight effect, associating it with the specified `FlowChunk`.
    ///
    /// This function should be used to mark individual child views within a parent view that has the `assembleSpotlightChunks` function applied to it.
    ///
    /// - Parameters:
    ///   - parentIdentifier: A unique string identifier for the parent view containing the spotlight effect.
    ///   - chunk: The `FlowChunk` associated with the current view, which determines the spotlight shape, background, and other properties.
    ///
    /// - Returns: The modified view with the matched geometry effect applied, allowing it to be highlighted by the spotlight effect.
    func configureChunkForSpotlight<Chunk: FlowChunk>(parentIdentifier: String, chunk: Chunk) -> some View {
        let namespace = getNamespace(from: parentIdentifier)

        return self
            .matchedGeometryEffect(
                id: chunk.id,
                in: namespace,
                properties: .frame,
                anchor: .center,
                isSource: true
            )
    }

    /// Sets up the parent view to contain the spotlight effect, using the provided `FlowChunk` instances.
    ///
    /// This function should be used to wrap the parent view containing child views that have the `configureChunkForSpotlight` function applied to them.
    ///
    /// The chunks provided must be of the same `FlowChunk` type as the one used by the child views, to ensure that the spotlight effect works as intended.
    ///
    /// - Parameters:
    ///   - uniqueIdentifier: A unique string identifier for the parent view. This identifier must be the same as the one provided to the `configureChunkForSpotlight` function for child views.
    ///   - chunks: An array of `FlowChunk` instances associated with the child views to be highlighted by the spotlight effect.
    ///
    /// - Returns: The modified view with the `HighlightingView` applied, containing the spotlight effect and its child views.
    func assembleSpotlightChunks<Chunk: FlowChunk>(uniqueIdentifier: String, chunks: [Chunk]) -> some View {
        let namespace = getNamespace(from: uniqueIdentifier)

        return HighlightingView(
            namespace: namespace,
            showTutorial: .constant(true),
            chunks: chunks
        ) {
            self
        }
    }

    func convertToInstructionsView(position: InstructionsViewPosition) -> InstructionsView {
        InstructionsView(position: position) {
            self
        }
    }
}

// MARK: - Helpful public extensions.
/// These are core and not related to FlowChunk directly.
public extension View {
    func eraseToAnyView() -> AnyView {
        AnyView(
            self
        )
    }
}


// MARK: - Helper Methods
fileprivate extension View {
    func getNamespace(from identifier: String) -> Namespace.ID {
        if let existingNamespace = FutureFlowManager.currentNamespaces[identifier] {
            return existingNamespace
        } else {
            let newNamespace = Namespace().wrappedValue
            FutureFlowManager.currentNamespaces[identifier] = newNamespace
            return newNamespace
        }
    }
}
