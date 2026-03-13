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
    @Published private var characters: [CharacterEntityModel] = []
    @Published private var isLoading: Bool = false
    @Published var errorMessage: String?
    
    private let getCharactersUseCase: GetCharactersUseCase
    
    init(getCharactersUseCase: GetCharactersUseCase) {
        self.getCharactersUseCase = getCharactersUseCase
    }
    
    func loadCharacters() {
        Task {
            do {
                self.isLoading = true
                self.errorMessage = nil
                
                let entities: [CharacterEntity] = try await self.getCharactersUseCase.execute()
                self.characters = entities.map { CharacterEntityModel.toObject(fromData: $0) }
                
                self.isLoading = false
            } catch {
                self.isLoading = false
                self.errorMessage = error.localizedDescription
            }
        }
    }
}
