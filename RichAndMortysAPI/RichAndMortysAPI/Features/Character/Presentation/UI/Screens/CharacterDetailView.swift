//
//  CharacterDetailView.swift
//  RichAndMortysAPI
//
//  Created by Valentino De Paola Gallardo on 16/03/26.
//

import SwiftUI

struct CharacterDetailView: View {
    var character: CharacterEntityModel
    
    var body: some View {
        VStack {
            CharacterImageView(
                imageURL: character.image,
                size: 140,
                cornerRadius: 22)
            Text(character.name)
                .font(.title)
                .foregroundStyle(.white)
                .fontWeight(.black)
            CharacterStatusView(
                characterStatus: character.status,
                characterSpecie: character.species,
                side: .horizontal)
            
            Text("INFO")
                .font(.headline)
                .foregroundStyle(.green)
                .fontWeight(.black)
            
            Spacer()
        }
        .animatedBackground()

    }
}
