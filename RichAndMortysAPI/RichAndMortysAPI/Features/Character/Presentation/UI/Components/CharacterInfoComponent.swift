//
//  CharacterInfoComponent.swift
//  RichAndMortysAPI
//
//  Created by Valentino De Paola Gallardo on 17/03/26.
//
import SwiftUI

struct CharacterInfoComponent: View {
    
    enum SideType: String {
        case twoComponents
        case threeComponents
    }
    
    var label: String
    var info: String
    var side: SideType
    var extraInfo: String?
        
    var body: some View {
        switch side {
        case .twoComponents:
            VStack(alignment: .center, spacing: 4) {
                
                Text(self.label.uppercased())
                    .font(.system(size: 10, weight: .semibold))
                    .tracking(1.2)
                    .foregroundStyle(Color(hex: "#4d805c"))
                
                Text(self.info)
                    .font(.system(size: 15, weight: .bold))
                    .foregroundStyle(Color(hex: "#bbface"))
                    .lineLimit(1)
                    .minimumScaleFactor(0.8)
            }
            .frame(maxWidth: .infinity, alignment: .center)
            .padding(.horizontal, 14)
            .padding(.vertical, 12)
            .background {
                RoundedRectangle(cornerRadius: 14, style: .continuous)
                    .fill(Color(hex: "#0a170e"))
                    .overlay {
                        RoundedRectangle(cornerRadius: 14, style: .continuous)
                            .strokeBorder(Color(hex: "#1d592f"), lineWidth: 1)
                    }
            }
            
        case .threeComponents:
            HStack(alignment: .center, spacing: 4) {
                VStack {
                    Text(self.label.uppercased())
                        .font(.system(size: 10, weight: .semibold))
                        .tracking(1.2)
                        .foregroundStyle(Color(hex: "#4d805c"))
                    
                    Text(self.info)
                        .font(.system(size: 10, weight: .medium))
                        .foregroundStyle(Color(hex: "#bbface"))
                        .lineLimit(2)
                        .minimumScaleFactor(0.8)
                }
                .padding(.leading, 14)
                
                Spacer()
                
                Text(self.extraInfo ?? "")
                    .foregroundStyle(Color(hex: "#48cf71"))
                    .font(.system(size: 40, weight: .heavy))
                    .padding(.trailing, 14)
                
            }
            .frame(maxWidth: .infinity, alignment: .center)
            .padding(.horizontal, 14)
            .padding(.vertical, 12)
            .background {
                RoundedRectangle(cornerRadius: 14, style: .continuous)
                    .fill(Color(hex: "#0a170e"))
                    .overlay {
                        RoundedRectangle(cornerRadius: 14, style: .continuous)
                            .strokeBorder(Color(hex: "#1d592f"), lineWidth: 1)
                    }
            }
        }
    }
}

#Preview {
    ZStack {
        AnimatedBackground()
        VStack {
            LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 10) {
                CharacterInfoComponent(label: "Genero", info: "Male", side: .twoComponents)
                CharacterInfoComponent(label: "Especie", info: "Human", side: .twoComponents)
                CharacterInfoComponent(label: "Origen", info: "Earth", side: .twoComponents)
                CharacterInfoComponent(label: "Ubicacion", info: "Citadel", side: .twoComponents)
            }
            
            CharacterInfoComponent(label: "Ubicacion", info: "Citadel", side: .threeComponents, extraInfo: "4")
        }

    }
}
