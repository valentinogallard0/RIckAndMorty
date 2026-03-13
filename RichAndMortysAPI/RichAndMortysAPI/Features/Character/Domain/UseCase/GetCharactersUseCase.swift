//
//  GetCharactersUseCase.swift
//  RichAndMortysAPI
//
//  Created by Valentino De Paola Gallardo on 12/03/26.
//

struct GetCharactersUseCase {
    private let repository: CharacterRemoteRepository
    
    init(repository: CharacterRemoteRepository){
        self.repository = repository
    }
    
    func execute() async throws -> [CharacterEntity] {
        let characters: [CharacterEntity] = try await self.repository.getCharacters()
        
        if characters.isEmpty {
            throw CharacterError.emptyCharacters
        }
        
        return characters
    }
}
