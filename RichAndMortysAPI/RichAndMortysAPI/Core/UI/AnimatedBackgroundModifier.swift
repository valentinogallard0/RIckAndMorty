//
//  AnimatedBackgroundModifier.swift
//  RichAndMortysAPI
//
//  Created by Valentino De Paola Gallardo on 13/03/26.
//

// View+AnimatedBackground.swift

import SwiftUI

struct AnimatedBackgroundModifier: ViewModifier {
    func body(content: Content) -> some View {
        ZStack {
            AnimatedBackground()
                .ignoresSafeArea()
            content
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

extension View {
    func animatedBackground() -> some View {
        modifier(AnimatedBackgroundModifier())
    }
}
