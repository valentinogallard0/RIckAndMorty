//
//  AnimatedBackground.swift
//  RichAndMortysAPI
//
//  Created by Valentino De Paola Gallardo on 13/03/26.

import SwiftUI
import Foundation

struct AnimatedBackground: View {
    
    struct Orb: Identifiable {
        let id = UUID()
        var color1: Color
        var color2: Color
        var size: CGFloat
        var blur: CGFloat
        var position: CGPoint
        var opacity: Double
        var scale: CGFloat
    }
    
    struct Flash: Identifiable {
        let id = UUID()
        var size: CGFloat
        var position: CGPoint
        var opacity: Double
        var scale: CGFloat
    }
    
    @State private var orbs: [Orb] = []
    @State private var flashes: [Flash] = []
    @State private var started = false
    
    var body: some View {
        GeometryReader { geo in
            ZStack {
                Color.black
                    .ignoresSafeArea()
                
                ForEach(orbs) { orb in
                    Circle()
                        .fill(
                            RadialGradient(
                                colors: [
                                    orb.color1,
                                    orb.color2,
                                    .clear
                                ],
                                center: .center,
                                startRadius: 0,
                                endRadius: orb.size * 0.55
                            )
                        )
                        .frame(width: orb.size, height: orb.size)
                        .blur(radius: orb.blur)
                        .scaleEffect(orb.scale)
                        .opacity(orb.opacity)
                        .position(orb.position)
                }
                
                ForEach(flashes) { flash in
                    Circle()
                        .fill(
                            RadialGradient(
                                colors: [
                                    Color.white.opacity(0.95),
                                    Color.white.opacity(0.22),
                                    .clear
                                ],
                                center: .center,
                                startRadius: 0,
                                endRadius: flash.size
                            )
                        )
                        .frame(width: flash.size, height: flash.size)
                        .scaleEffect(flash.scale)
                        .opacity(flash.opacity)
                        .position(flash.position)
                        .blur(radius: 18)
                }
            }
            .onAppear {
                guard !started else { return }
                started = true
                
                setupOrbs(in: geo.size)
                startOrbMotion(in: geo.size)
                startFlashLoop(in: geo.size)
            }
        }
    }
}

// MARK: - Setup
private extension AnimatedBackground {
    
    func randomPoint(in size: CGSize) -> CGPoint {
        CGPoint(
            x: CGFloat.random(in: 0...size.width),
            y: CGFloat.random(in: 0...size.height)
        )
    }
    
    func randomOrb(
        in size: CGSize,
        palette: (Color, Color),
        sizeRange: ClosedRange<CGFloat>,
        blur: CGFloat
    ) -> Orb {
        Orb(
            color1: palette.0,
            color2: palette.1,
            size: CGFloat.random(in: sizeRange),
            blur: blur,
            position: randomPoint(in: size),
            opacity: Double.random(in: 0.35...0.85),
            scale: CGFloat.random(in: 0.85...1.2)
        )
    }
    
    func setupOrbs(in size: CGSize) {
        orbs = [
            randomOrb(
                in: size,
                palette: (Color(hex: "#00ff66"), Color(hex: "#007733")),
                sizeRange: 220...340,
                blur: 48
            ),
            randomOrb(
                in: size,
                palette: (Color(hex: "#1a6fff"), Color(hex: "#0033aa")),
                sizeRange: 180...280,
                blur: 40
            ),
            randomOrb(
                in: size,
                palette: (Color(hex: "#00cc55"), Color(hex: "#004422")),
                sizeRange: 140...230,
                blur: 38
            ),
            randomOrb(
                in: size,
                palette: (Color(hex: "#2255ff"), Color(hex: "#001166")),
                sizeRange: 120...200,
                blur: 34
            ),
            randomOrb(
                in: size,
                palette: (Color(hex: "#00ffaa"), Color(hex: "#003322")),
                sizeRange: 100...180,
                blur: 32
            )
        ]
    }
}

// MARK: - Orb Motion
private extension AnimatedBackground {
    
    func startOrbMotion(in size: CGSize) {
        for index in orbs.indices {
            animateOrb(index: index, in: size)
        }
    }
    
    func animateOrb(index: Int, in size: CGSize) {
        guard index < orbs.count else { return }
        
        let duration = Double.random(in: 5.5...10.5)
        let delay = Double.random(in: 0.2...1.4)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
            guard index < orbs.count else { return }
            
            withAnimation(.easeInOut(duration: duration)) {
                orbs[index].position = randomPoint(in: size)
                orbs[index].scale = CGFloat.random(in: 0.8...1.35)
                orbs[index].opacity = Double.random(in: 0.25...0.9)
                orbs[index].size = max(90, orbs[index].size + CGFloat.random(in: -28...28))
            }
            
            // Flash muy ocasional
            if Int.random(in: 0...8) == 0 {
                createFlash(around: orbs[index].position)
            }
            
            animateOrb(index: index, in: size)
        }
    }
}

// MARK: - Flash
private extension AnimatedBackground {
    
    func startFlashLoop(in size: CGSize) {
        let delay = Double.random(in: 3.5...7.0)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
            if Bool.random(), let orb = orbs.randomElement() {
                createFlash(around: orb.position)
            }
            
            startFlashLoop(in: size)
        }
    }
    
    func createFlash(around center: CGPoint) {
        let flash = Flash(
            size: CGFloat.random(in: 90...170),
            position: CGPoint(
                x: center.x + CGFloat.random(in: -35...35),
                y: center.y + CGFloat.random(in: -35...35)
            ),
            opacity: Double.random(in: 0.12...0.28),
            scale: 0.2
        )
        
        flashes.append(flash)
        guard let index = flashes.indices.last else { return }
        
        let duration = Double.random(in: 0.35...0.65)
        
        withAnimation(.easeOut(duration: duration)) {
            flashes[index].scale = CGFloat.random(in: 1.15...1.75)
            flashes[index].opacity = 0
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + duration + 0.08) {
            guard index < flashes.count else { return }
            let id = flashes[index].id
            flashes.removeAll { $0.id == id }
        }
    }
}

#Preview {
    AnimatedBackground()
}
