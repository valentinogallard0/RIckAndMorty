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
        NavigationStack {
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
                    ScrollView(.vertical, showsIndicators: false) {
                        LazyVStack(spacing: 12) {
                            ForEach(viewModel.characters, id: \.id) { character in
                                NavigationLink {
                                    CharacterDetailView()
                                } label: {
                                    HStack {
                                        CharacterImageView(imageURL: character.image)
                                        Text(character.name)
                                            .foregroundStyle(.white)
                                            .fontWeight(.black)
                                            .frame(maxWidth: .infinity, alignment: .center)
                                        Spacer()
                                        CharacterStatusView(characterStatus: character.status, characterSpecie: character.species)
                                    } //: HStack
                                    .padding(.horizontal, 16)
                                    .padding(.vertical, 10)
                                    .background {
                                        RoundedRectangle(cornerRadius: 16)
                                            .stroke(
                                                LinearGradient(
                                                    colors: [
                                                        Color.white.opacity(0.2),
                                                        Color.white.opacity(0.2)
                                                    ],
                                                    startPoint: .topLeading,
                                                    endPoint: .bottomTrailing
                                                ),
                                                lineWidth: 1
                                            )
                                    }
                                }
                                .buttonStyle(.plain)
                            }
                        }
                        .padding(.horizontal, 10)
                        .padding(.bottom, 16)
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                }
            }
            .animatedBackground()
            .toolbarBackground(.hidden, for: .navigationBar)
            .task {
                await viewModel.loadCharactersIfNeeded()
            }
        }
    }
}

#Preview {
    AppContainer().makeCharacterView()
}
