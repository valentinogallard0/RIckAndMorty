//
//  AnimatedBackground.swift
//  RichAndMortysAPI
//
//  Created by Valentino De Paola Gallardo on 13/03/26.
//

// AnimatedBackground.swift

import SwiftUI

struct AnimatedBackground: View {
    
    @State private var animate = false
    
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            
            // Orbe verde central
            Circle()
                .fill(
                    RadialGradient(
                        colors: [Color(hex: "#0d5c2e"), .clear],
                        center: .center,
                        startRadius: 0,
                        endRadius: 150
                    )
                )
                .frame(width: 300, height: 300)
                .blur(radius: 60)
                .opacity(animate ? 0.55 : 1.0)
                .animation(.easeInOut(duration: 6).repeatForever(autoreverses: true), value: animate)
            
            // Orbe azul superior izquierdo
            Circle()
                .fill(
                    RadialGradient(
                        colors: [Color(hex: "#0a2a6e"), .clear],
                        center: .center,
                        startRadius: 0,
                        endRadius: 110
                    )
                )
                .frame(width: 220, height: 220)
                .blur(radius: 50)
                .offset(x: -80, y: -140)
                .opacity(animate ? 1.0 : 0.5)
                .animation(.easeInOut(duration: 8).repeatForever(autoreverses: true), value: animate)
            
            // Orbe verde inferior derecho
            Circle()
                .fill(
                    RadialGradient(
                        colors: [Color(hex: "#062e18"), .clear],
                        center: .center,
                        startRadius: 0,
                        endRadius: 90
                    )
                )
                .frame(width: 180, height: 180)
                .blur(radius: 45)
                .offset(x: 90, y: 160)
                .opacity(animate ? 0.85 : 0.4)
                .animation(.easeInOut(duration: 7).repeatForever(autoreverses: true), value: animate)
            
            // Orbe azul superior derecho
            Circle()
                .fill(
                    RadialGradient(
                        colors: [Color(hex: "#071d50"), .clear],
                        center: .center,
                        startRadius: 0,
                        endRadius: 70
                    )
                )
                .frame(width: 140, height: 140)
                .blur(radius: 40)
                .offset(x: 100, y: -180)
                .opacity(animate ? 1.0 : 0.4)
                .animation(.easeInOut(duration: 9).repeatForever(autoreverses: true).delay(2), value: animate)
            
            // Anillo exterior rotando
            Circle()
                .stroke(Color(hex: "#14b450").opacity(0.18), lineWidth: 1.5)
                .frame(width: 260, height: 260)
                .rotationEffect(.degrees(animate ? 360 : 0))
                .animation(.linear(duration: 12).repeatForever(autoreverses: false), value: animate)
            
            // Anillo interior rotando al revés
            Circle()
                .stroke(Color(hex: "#1e50c8").opacity(0.15), lineWidth: 1)
                .frame(width: 180, height: 180)
                .rotationEffect(.degrees(animate ? -360 : 0))
                .animation(.linear(duration: 18).repeatForever(autoreverses: false), value: animate)
        }
        .onAppear { animate = true }
    }
}
