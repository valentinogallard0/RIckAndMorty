//
//  CharacterDataSourceRemoteRepository.swift
//  RichAndMortysAPI
//
//  Created by Valentino De Paola Gallardo on 08/03/26.
//
import Foundation

struct CharacterDataSourceRemoteRepository: CharacterRemoteRepository {
    private let apiClient: APIClient
    
    init(apiClient: APIClient) {
        self.apiClient = apiClient
    }
    
    func getCharacters() async throws -> [CharacterEntity] {
        let responseDTO: CharacterListDTO = try await self.apiClient.get("/character", as: CharacterListDTO.self)
        return responseDTO.toEntity()
    }
    
    func getCharacter(id: Int) async throws -> CharacterEntity {
        let dto: CharacterDTO = try await self.apiClient.get("/character/\(id)", as: CharacterDTO.self)
        return dto.toEntity()
    }
}
