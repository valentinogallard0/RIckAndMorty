//
//  AnimatedBackground.swift
//  RichAndMortysAPI
//
//  Created by Valentino De Paola Gallardo on 13/03/26.

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
                        colors: [Color(hex: "#00ff66"), Color(hex: "#007733"), .clear],
                        center: .center,
                        startRadius: 0,
                        endRadius: 150
                    )
                )
                .frame(width: 300, height: 300)
                .blur(radius: 45)
                .opacity(animate ? 0.45 : 1.0)
                .animation(.easeInOut(duration: 6).repeatForever(autoreverses: true), value: animate)
            
            // Orbe azul superior izquierdo
            Circle()
                .fill(
                    RadialGradient(
                        colors: [Color(hex: "#1a6fff"), Color(hex: "#0033aa"), .clear],
                        center: .center,
                        startRadius: 0,
                        endRadius: 110
                    )
                )
                .frame(width: 220, height: 220)
                .blur(radius: 38)
                .offset(x: -80, y: -140)
                .opacity(animate ? 1.0 : 0.5)
                .animation(.easeInOut(duration: 8).repeatForever(autoreverses: true), value: animate)
            
            // Orbe verde inferior derecho
            Circle()
                .fill(
                    RadialGradient(
                        colors: [Color(hex: "#00cc55"), Color(hex: "#004422"), .clear],
                        center: .center,
                        startRadius: 0,
                        endRadius: 90
                    )
                )
                .frame(width: 180, height: 180)
                .blur(radius: 36)
                .offset(x: 110, y: 180)
                .opacity(animate ? 0.9 : 0.4)
                .animation(.easeInOut(duration: 7).repeatForever(autoreverses: true), value: animate)
            
            // Orbe azul superior derecho
            Circle()
                .fill(
                    RadialGradient(
                        colors: [Color(hex: "#2255ff"), Color(hex: "#001166"), .clear],
                        center: .center,
                        startRadius: 0,
                        endRadius: 70
                    )
                )
                .frame(width: 150, height: 150)
                .blur(radius: 32)
                .offset(x: 120, y: -190)
                .opacity(animate ? 1.0 : 0.4)
                .animation(.easeInOut(duration: 9).repeatForever(autoreverses: true).delay(2), value: animate)
            
            // Orbe verde agua inferior izquierdo
            Circle()
                .fill(
                    RadialGradient(
                        colors: [Color(hex: "#00ffaa"), Color(hex: "#003322"), .clear],
                        center: .center,
                        startRadius: 0,
                        endRadius: 80
                    )
                )
                .frame(width: 130, height: 130)
                .blur(radius: 30)
                .offset(x: -110, y: 150)
                .opacity(animate ? 1.0 : 0.45)
                .animation(.easeInOut(duration: 10).repeatForever(autoreverses: true).delay(1), value: animate)
            
            // Anillo exterior rotando
            Circle()
                .stroke(Color(hex: "#00ff50").opacity(0.28), lineWidth: 1.5)
                .frame(width: 260, height: 260)
                .rotationEffect(.degrees(animate ? 360 : 0))
                .animation(.linear(duration: 12).repeatForever(autoreverses: false), value: animate)
            
            // Anillo interior rotando al revés
            Circle()
                .stroke(Color(hex: "#2864ff").opacity(0.25), lineWidth: 1)
                .frame(width: 180, height: 180)
                .rotationEffect(.degrees(animate ? -360 : 0))
                .animation(.linear(duration: 18).repeatForever(autoreverses: false), value: animate)
            
            // Anillo extra grande
            Circle()
                .stroke(Color(hex: "#00c864").opacity(0.12), lineWidth: 1)
                .frame(width: 340, height: 340)
                .rotationEffect(.degrees(animate ? 360 : 0))
                .animation(.linear(duration: 25).repeatForever(autoreverses: false), value: animate)
        }
        .onAppear { animate = true }
    }
}
