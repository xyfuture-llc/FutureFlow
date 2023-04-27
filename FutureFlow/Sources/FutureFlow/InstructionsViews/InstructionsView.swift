//
//  InstructionsView.swift
//  
//
//  Created by Muhand Jumah on 4/23/23.
//

import SwiftUI

public struct InstructionsView : View {
    internal let position: InstructionsViewPosition
    private let content: AnyView

    internal init<Content: View>
    (
        position: InstructionsViewPosition = .below,
        @ViewBuilder _ content: () -> Content
    ) {
        self.position = position
        self.content = content().eraseToAnyView()
    }

    @_spi(Private)
    public var body: some View {
        self.content
    }
}
