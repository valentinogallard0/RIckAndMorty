//
//  SearchBar.swift
//  RichAndMortysAPI
//
//  Created by Valentino De Paola Gallardo on 16/03/26.
//

import SwiftUI

struct SearchBar: View {

    @Binding var text: String
    @FocusState private var isFocused: Bool

    var body: some View {
        HStack(spacing: 8) {

            // Icono lupa
            Image(systemName: "magnifyingglass")
                .font(.system(size: 15, weight: .medium))
                .foregroundStyle(isFocused ? Color(hex: "#4ade80") : .white.opacity(0.35))
                .animation(.easeInOut(duration: 0.2), value: isFocused)

            // Campo de texto
            TextField("", text: $text, prompt:
                Text("Search characters...")
                    .foregroundStyle(.white.opacity(0.3))
            )
            .font(.system(size: 14, weight: .medium))
            .foregroundStyle(.white)
            .focused($isFocused)
            .autocorrectionDisabled()
            .textInputAutocapitalization(.never)

            // Botón limpiar
            if !text.isEmpty {
                Button {
                    text = ""
                } label: {
                    Image(systemName: "xmark.circle.fill")
                        .font(.system(size: 15))
                        .foregroundStyle(.white.opacity(0.4))
                }
                .transition(.scale.combined(with: .opacity))
            }
        }
        .padding(.horizontal, 14)
        .padding(.vertical, 10)
        .background {
            RoundedRectangle(cornerRadius: 14, style: .continuous)
                .fill(.ultraThinMaterial)
                .overlay {
                    RoundedRectangle(cornerRadius: 14, style: .continuous)
                        .strokeBorder(
                            isFocused
                                ? Color(hex: "#4ade80").opacity(0.45)
                                : .white.opacity(0.1),
                            lineWidth: 1
                        )
                        .animation(.easeInOut(duration: 0.25), value: isFocused)
                }
        }
        .animation(.easeInOut(duration: 0.2), value: text.isEmpty)
    }
}

// MARK: - Preview
#Preview {
    ZStack {
        AnimatedBackground()
        VStack(spacing: 20) {
            // Estado vacío
            SearchBarPreviewWrapper()
        }
        .padding(.horizontal, 16)
    }
}

private struct SearchBarPreviewWrapper: View {
    @State private var query = ""
    var body: some View {
        SearchBar(text: $query)
    }
}
