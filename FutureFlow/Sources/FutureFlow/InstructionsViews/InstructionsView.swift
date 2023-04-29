//
//  InstructionsView.swift
//  
//
//  Created by Muhand Jumah on 4/23/23.
//

import SwiftUI

public protocol InstructionsView: View {
}

extension InstructionsView {
    func eraseToAnyInstructionsView() -> AnyInstructionsView {
        AnyInstructionsView(
            self
        )
    }
}
