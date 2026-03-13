//
//  GetCharacterDetailUseCase.swift
//  RichAndMortysAPI
//
//  Created by Valentino De Paola Gallardo on 12/03/26.
//

import Foundation

struct GetCharacterDetailUseCase {
    private let repository: CharacterRemoteRepository
    
    init(repository: CharacterRemoteRepository) {
        self.repository = repository
    }
    
    func execute(id: Int) async throws -> CharacterEntity {
        if id <= 0 {
            throw CharacterError.invalidID
        }
        return try await self.repository.getCharacter(id: id)
    }
}
