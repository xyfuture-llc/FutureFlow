//
//  AnyInstructionsView.swift
//  
//
//  Created by Muhand Jumah on 4/29/23.
//

import SwiftUI

public struct AnyInstructionsView: InstructionsView {
    private let _view: () -> AnyView

    public var body: some View {
        _view()
    }

    public init<I: InstructionsView>(_ instructionsView: I) {
        _view = {
            instructionsView
                .eraseToAnyView()
        }
    }
}
