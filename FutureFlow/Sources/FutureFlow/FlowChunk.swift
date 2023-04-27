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

    var instructionsViewType: InstructionsViewType? { get }
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

    var instructionsViewType: InstructionsViewType? {
        return nil
    }
}
