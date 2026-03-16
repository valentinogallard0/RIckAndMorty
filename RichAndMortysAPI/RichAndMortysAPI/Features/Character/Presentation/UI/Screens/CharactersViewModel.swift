//
//  CharactersViewModel.swift
//  RichAndMortysAPI
//
//  Created by Valentino De Paola Gallardo on 13/03/26.
//

import Foundation
import SwiftUI
import Combine

@MainActor
final class CharactersViewModel: ObservableObject {
    @Published private(set) var characters: [CharacterEntityModel] = []
    @Published private(set) var isLoading: Bool = false
    @Published var errorMessage: String?
    
    private let getCharactersUseCase: GetCharactersUseCase
    
    init(getCharactersUseCase: GetCharactersUseCase) {
        self.getCharactersUseCase = getCharactersUseCase
    }
    
    func loadCharactersIfNeeded() async {
        guard characters.isEmpty, !isLoading else { return }
        await loadCharacters()
    }
    
    func loadCharacters() async {
        isLoading = true
        errorMessage = nil
        
        defer { isLoading = false }
        
        do {
            let entities = try await getCharactersUseCase.execute()
            characters = entities.map{ CharacterEntityModel.toObject(fromData: $0)}
        } catch {
            errorMessage = error.localizedDescription
        }
    }
}
