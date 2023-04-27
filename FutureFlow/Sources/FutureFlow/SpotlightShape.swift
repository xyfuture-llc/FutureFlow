//
//  SpotlightShape.swift
//  
//
//  Created by Muhand Jumah on 4/23/23.
//

import SwiftUI

fileprivate let MATCHED_GEOMETRY_ID: Int = 9998

public enum SpotlightShape {
    case rectangle (
        color: Color = .white,
        blurRadius: CGFloat = 1.0
    )

    case circle (
        color: Color = .white,
        blurRadius: CGFloat = 1.0
    )

    case custom (
        view: () -> AnyView
    )
}

// MARK: - Internal API
internal extension SpotlightShape {
    func body(_ namespace: Namespace.ID) -> some View {
        ZStack {
            switch self {
            case .rectangle(let color, let blurRadius):
                self.defaultRectangle(namespace, foregroundColor: color, blurRadius: blurRadius)
            case .circle(let color, let blurRadius):
                self.defaultCircle(namespace, foregroundColor: color, blurRadius: blurRadius)
            case .custom(let av):
                av()
                    .matchedGeometryEffect(id: MATCHED_GEOMETRY_ID,
                                           in: namespace)
            }
        }
    }
}

// MARK: - Default Shapes
private extension SpotlightShape {
    func defaultRectangle(_ namespace: Namespace.ID, foregroundColor: Color, blurRadius: CGFloat) -> some View {
        Rectangle()
            .matchedGeometryEffect(id: MATCHED_GEOMETRY_ID,
                                   in: namespace)
            .foregroundColor(foregroundColor)
            .blur(radius: blurRadius)
    }

    func defaultCircle(_ namespace: Namespace.ID, foregroundColor: Color, blurRadius: CGFloat) -> some View {
        Circle()
            .matchedGeometryEffect(id: MATCHED_GEOMETRY_ID,
                                   in: namespace)
            .foregroundColor(foregroundColor)
            .blur(radius: blurRadius)
    }
}
