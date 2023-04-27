//
//  BlurView.swift
//  
//
//  Created by Muhand Jumah on 4/23/23.
//

#if os(iOS)
import SwiftUI

internal struct BlurView: UIViewRepresentable {
    private var style: UIBlurEffect.Style

    internal init(style: UIBlurEffect.Style) {
        self.style = style
    }

    internal func makeUIView(context: Context) -> UIVisualEffectView {
        let view = UIVisualEffectView(effect: UIBlurEffect(style: style))
        return view
    }

    internal func updateUIView(_ uiView: UIVisualEffectView, context: Context) {
        uiView.effect = UIBlurEffect(style: style)
    }
}
#endif
