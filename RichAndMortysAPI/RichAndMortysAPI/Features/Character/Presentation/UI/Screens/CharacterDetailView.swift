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
            
            //TODO: Mapear la informacion restante de los personajes, actualmente hay algunas que aun tenemos hardcodeadas.
            LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 10) {
                CharacterInfoComponent(label: "Genero", info: character.gender, side: .twoComponents)
                CharacterInfoComponent(label: "Especie", info: character.species, side: .twoComponents)
                CharacterInfoComponent(label: "Origen", info: character.origin.name, side: .twoComponents)
                CharacterInfoComponent(label: "Ubicacion", info: character.location.name, side: .twoComponents)
            }
            .padding(.horizontal, 16)

            CharacterInfoComponent(label: "Episodes", info: "Apariciones totales", side: .threeComponents, extraInfo: "5")
                .padding(.horizontal, 16)
            
            Spacer()
        }
        .animatedBackground()

    }
}
