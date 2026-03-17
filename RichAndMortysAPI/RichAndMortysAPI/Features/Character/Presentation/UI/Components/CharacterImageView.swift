//
//  CharacterImageView.swift
//  RichAndMortysAPI
//
//  Created by Valentino De Paola Gallardo on 15/03/26.
//
import SwiftUI
import Foundation

struct CharacterImageView: View {
    var imageURL: URL
    var size: CGFloat
    var cornerRadius: CGFloat

    var body: some View {
        AsyncImage(url: imageURL) { phase in
            switch phase {
            case .empty:
                placeholder
                    .overlay {
                        ProgressView()
                            .tint(.white.opacity(0.8))
                    }
            case .success(let image):
                image
                    .resizable()
                    .scaledToFill()
            case .failure:
                placeholder
                    .overlay {
                        Image(systemName: "photo")
                            .font(.system(size: 24, weight: .semibold))
                            .foregroundStyle(.white.opacity(0.75))
                    }
            @unknown default:
                placeholder
            }
        }
        .frame(width: size, height: size)
        .background(Color(hex: "#0C2D16"))
        .clipShape(RoundedRectangle(cornerRadius: cornerRadius, style: .continuous))
        .overlay {
            RoundedRectangle(cornerRadius: cornerRadius, style: .continuous)
                .stroke(Color.white.opacity(0.06), lineWidth: 1)
        }
    }

    private var placeholder: some View {
        Color(hex: "#0C2D16")
    }
}


#Preview {
    CharacterImageView(
        imageURL: URL(string: "https://rickandmortyapi.com/api/character/avatar/1.jpeg")!,
        size: 76,
        cornerRadius: 22
    )
}
