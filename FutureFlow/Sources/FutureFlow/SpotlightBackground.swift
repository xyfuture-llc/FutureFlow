//
//  SpotlightBackground.swift
//  
//
//  Created by Muhand Jumah on 4/23/23.
//

import SwiftUI

fileprivate let MATCHED_GEOMETRY_ID: Int = 9999

public enum SpotlightBackground {
    case ultraThinMaterial
    
    case black
    
    case customColor (
        _ color: Color,
        opacity: CGFloat = 0.5
    )
    
    case custom(
        view: () -> AnyView
    )
}

// MARK: - Internal API
internal extension SpotlightBackground {
    func body(_ namespace: Namespace.ID) -> some View {
        ZStack {
            switch self {
            case .ultraThinMaterial:
                self.defaultUltraThinMaterial(namespace)
            case .black:
                self.defaultBlackBackground(namespace)
                
            case .customColor(let color, let opacity):
                self.defaultCustomColorBackground(namespace, color: color, opacity: opacity)
                
            case .custom(let av):
                av()
                    .matchedGeometryEffect(id: MATCHED_GEOMETRY_ID,
                                           in: namespace)
            }
        }
    }
}

// MARK: - Default Backgrounds
private extension SpotlightBackground {
    func defaultUltraThinMaterial(_ namespace: Namespace.ID) -> some View {
        if #available(iOS 15, macOS 12, *) {
            return Color.clear
                .matchedGeometryEffect(id: MATCHED_GEOMETRY_ID,
                                       in: namespace)
                .background(.ultraThinMaterial)
                .edgesIgnoringSafeArea(.all)
        } else {
#if os(iOS)
            return BlurView(style: .extraLight)
#else
            return self.defaultBlackBackground(namespace)
#endif
        }
    }
    
    func defaultBlackBackground(_ namespace: Namespace.ID) -> some View {
        return defaultCustomColorBackground(namespace, color: .black, opacity: 0.5)
    }
    
    func defaultCustomColorBackground(_ namespace: Namespace.ID, color: Color, opacity: CGFloat) -> some View {
        color
            .matchedGeometryEffect(id: MATCHED_GEOMETRY_ID,
                                   in: namespace)
            .edgesIgnoringSafeArea(.all)
            .opacity(opacity)
    }
}
