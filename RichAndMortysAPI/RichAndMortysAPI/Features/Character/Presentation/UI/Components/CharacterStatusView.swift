//
//  CharacterStatusView.swift
//  RichAndMortysAPI
//
//  Created by Valentino De Paola Gallardo on 15/03/26.
//
import SwiftUI

struct CharacterStatusView: View {
    
    enum CharacterStatus: String {
        case alive = "Alive"
        case dead = "Dead"
        case unknown = "Unknown"
        
        init(status: String) {
            self = CharacterStatus(rawValue: status) ?? .unknown
        }
        
        var color: Color {
            switch self {
            case .alive:
                return .green
            case .dead:
                return .red
            case .unknown:
                return .orange
            }
        }
        
        var title: String {
            rawValue
        }
    }
    
    enum Side: String {
        case horizontal
        case vertical
    }
    
    var characterStatus: String
    var characterSpecie: String
    var side: Side
    private var status: CharacterStatus {
        CharacterStatus(status: characterStatus)
    }
    
    var body: some View {
        switch side {
        case .vertical:
            VStack(alignment: .trailing) {
                HStack(spacing: 8) {
                    Circle()
                        .fill(status.color)
                        .frame(width: 8, height: 8)
                    
                    Text(status.title)
                        .font(.footnote)
                        .foregroundStyle(status.color)
                }
                
                Text(characterSpecie)
                    .padding(3)
                    .font(.footnote)
                    .foregroundStyle(status.color)
                    .fontWeight(.black)
                    .background(
                        RoundedRectangle(cornerRadius: 4)
                            .fill(
                                LinearGradient(colors: [status.color, status.color], startPoint: .leading, endPoint: .trailing)
                                    .opacity(0.3)
                            )
                    )
                    .foregroundStyle(status.color)
            }
        case .horizontal:
            HStack {
                HStack(spacing: 8) {
                    Circle()
                        .fill(status.color)
                        .frame(width: 8, height: 8)
                    
                    Text(status.title)
                        .font(.footnote)
                        .foregroundStyle(status.color)
                }
                
                Text(characterSpecie)
                    .padding(3)
                    .font(.footnote)
                    .foregroundStyle(status.color)
                    .fontWeight(.black)
                    .background(
                        RoundedRectangle(cornerRadius: 4)
                            .fill(
                                LinearGradient(colors: [status.color, status.color], startPoint: .leading, endPoint: .trailing)
                                    .opacity(0.3)
                            )
                    )
                    .foregroundStyle(status.color)
            }
        }
    }
}


#Preview {
    CharacterStatusView(characterStatus: "Alive", characterSpecie: "Human", side: .vertical)
}
