//
//  CharactersView.swift
//  RichAndMortysAPI
//
//  Created by Valentino De Paola Gallardo on 13/03/26.
//
import SwiftUI

struct CharactersView: View {
    @StateObject private var viewModel: CharactersViewModel
    @State var searchText: String = ""
    
    init(viewModel: CharactersViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 16) {
                
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
                    HStack {
                        Text("Characters")
                            .font(.title)
                            .fontWeight(.black)
                            .foregroundStyle(Color.white)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.leading)
                        
                        Spacer()
                        
                        Text("\(viewModel.characters.count)")
                            .foregroundStyle(Color.green)
                            .fontWeight(.black)
                            .padding(.trailing)
                    }
                    
                    SearchBar(text: $searchText)
                        .padding(.horizontal, 16)
                    
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
                                }
                                .buttonStyle(.plain)
                                Divider()
                                    .background(.gray.opacity(0.2))
                            }
                        }
                        .padding(.horizontal, 10)
                        .padding(.bottom, 16)
                    } //ScrollView
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                }
            }// VStack
            .animatedBackground()
            .toolbarBackground(.hidden, for: .navigationBar)
            .task {
                await viewModel.loadCharactersIfNeeded()
            }
        } // NavigationStack
    }
}

#Preview {
    AppContainer().makeCharacterView()
}
