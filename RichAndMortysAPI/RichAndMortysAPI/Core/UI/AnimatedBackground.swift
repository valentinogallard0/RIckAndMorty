//
//  AnimatedBackground.swift
//  RichAndMortysAPI
//
//  Created by Valentino De Paola Gallardo on 13/03/26.

import SwiftUI

struct AnimatedBackground: View {

    @State private var phase: Bool = false

    var body: some View {
        GeometryReader { geo in
            ZStack {
                Color.black.ignoresSafeArea()

                // Glow principal — respira suave (escala + opacidad)
                RadialGradient(
                    colors: [
                        Color(hex: "#1a5c1a").opacity(phase ? 0.95 : 0.6),
                        Color(hex: "#0d2e0d").opacity(phase ? 0.65 : 0.35),
                        Color.clear
                    ],
                    center: .init(x: 0.5, y: -0.05),
                    startRadius: 0,
                    endRadius: geo.size.height * (phase ? 0.72 : 0.55)
                )
                .ignoresSafeArea()
                .animation(
                    .easeInOut(duration: 3.8).repeatForever(autoreverses: true),
                    value: phase
                )

                // Orb izquierda — se desplaza ligeramente
                RadialGradient(
                    colors: [
                        Color(hex: "#0d4a0d").opacity(phase ? 0.55 : 0.25),
                        Color.clear
                    ],
                    center: .init(x: phase ? 0.05 : -0.05, y: phase ? 0.04 : 0.1),
                    startRadius: 0,
                    endRadius: geo.size.width * (phase ? 0.65 : 0.48)
                )
                .ignoresSafeArea()
                .animation(
                    .easeInOut(duration: 5.2).repeatForever(autoreverses: true),
                    value: phase
                )

                // Orb derecha — desfasado
                RadialGradient(
                    colors: [
                        Color(hex: "#0a3d0a").opacity(phase ? 0.35 : 0.55),
                        Color.clear
                    ],
                    center: .init(x: phase ? 0.95 : 1.05, y: phase ? 0.1 : 0.04),
                    startRadius: 0,
                    endRadius: geo.size.width * (phase ? 0.48 : 0.62)
                )
                .ignoresSafeArea()
                .animation(
                    .easeInOut(duration: 4.5).repeatForever(autoreverses: true),
                    value: phase
                )

                // Destello central tenue — pulso muy lento
                RadialGradient(
                    colors: [
                        Color(hex: "#22ff77").opacity(phase ? 0.07 : 0.02),
                        Color.clear
                    ],
                    center: .init(x: 0.5, y: 0.0),
                    startRadius: 0,
                    endRadius: geo.size.width * 0.4
                )
                .ignoresSafeArea()
                .animation(
                    .easeInOut(duration: 2.6).repeatForever(autoreverses: true),
                    value: phase
                )
            }
            .onAppear {
                phase = true
            }
        }
    }
}

#Preview {
    AnimatedBackground()
}
