//
//  CharactersView.swift
//  RichAndMortysAPI
//
//  Created by Valentino De Paola Gallardo on 13/03/26.
//
import SwiftUI

struct CharactersView: View {
    @StateObject private var viewModel: CharactersViewModel
    
    init(viewModel: CharactersViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        VStack(spacing: 16) {
            
            Image("RickAndMorty")
                .resizable()
                .scaledToFit()
                .frame(width: 180)
                .frame(maxWidth: .infinity)
                .padding(.top, 12)
            
            if viewModel.isLoading {
                ProgressView()
                    .tint(.white)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            } else if let errorMessage = viewModel.errorMessage {
                Text(errorMessage)
                    .foregroundStyle(.white)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 24)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            } else {
                List(viewModel.characters, id: \.id) { character in
                    HStack {
                        CharacterImageView(imageURL: character.image)
                        Text(character.name)
                            .foregroundStyle(.white)
                            .fontWeight(.black)
                            .frame(maxWidth: .infinity, alignment: .center)
                        Spacer()
                        CharacterStatusView(characterStatus: character.status, characterSpecie: character.species)
                    }
                    .listRowBackground(Color.clear)

                }
                .listStyle(.plain)
                .scrollContentBackground(.hidden)
                .background(Color.clear)
            }
        }
        .animatedBackground()
        .task {
            await viewModel.loadCharactersIfNeeded()
        }
    }
}
