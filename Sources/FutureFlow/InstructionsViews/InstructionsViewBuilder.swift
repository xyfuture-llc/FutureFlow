//
//  InstructionsViewBuilder.swift
//  
//
//  Created by Muhand Jumah on 4/29/23.
//

import Foundation
@resultBuilder
public struct InstructionsViewBuilder {
    public static func buildBlock<Content: InstructionsView>(_ instructionsView: Content?) -> AnyInstructionsView? {
        instructionsView?
            .eraseToAnyInstructionsView()
    }

    public static func buildEither<Content: InstructionsView>(first component: Content?) -> AnyInstructionsView? {
        component?
            .eraseToAnyInstructionsView()
    }

    public static func buildEither<Content: InstructionsView>(second component: Content?) -> AnyInstructionsView? {
        component?
            .eraseToAnyInstructionsView()
    }
    
}
