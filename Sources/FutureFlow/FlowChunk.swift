//
//  FlowChunk.swift
//  
//
//  Created by Muhand Jumah on 4/23/23.
//

import SwiftUI

public protocol FlowChunk: Hashable, Identifiable {
    var spotlightShape: SpotlightShape { get }
    var spotlightBackground: SpotlightBackground { get }

    @InstructionsViewBuilder func instructionsView(
        _ next: @escaping () -> (),
        _ back: @escaping () -> ()
    ) -> AnyInstructionsView?

    var instructionsViewPosition: InstructionsViewPosition? { get }
}

public extension FlowChunk {
    var id: Int {
        self.hashValue
    }

    var spotlightShape: SpotlightShape {
        return .rectangle()
    }

    var spotlightBackground: SpotlightBackground {
        return .black
    }

    func instructionsView(
        _ next: @escaping () -> (),
        _ back: @escaping () -> ()
    ) -> AnyInstructionsView? {
        nil
    }

    var instructionsViewPosition: InstructionsViewPosition? {
        return nil
    }
}
