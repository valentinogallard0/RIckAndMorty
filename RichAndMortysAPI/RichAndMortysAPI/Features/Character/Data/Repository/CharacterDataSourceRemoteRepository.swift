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
    
    func getCharacters(name: String?) async throws -> [CharacterEntity] {
        let trimmedName = name?.trimmingCharacters(in: .whitespacesAndNewlines)
        
        do {
            let responseDTO: CharacterListDTO
            
            if let trimmedName, !trimmedName.isEmpty {
                let queryItems = [
                    URLQueryItem(name: "name", value: trimmedName)
                ]
                
                responseDTO = try await apiClient.get(
                    "/character",
                    queryItems: queryItems,
                    as: CharacterListDTO.self
                )
            } else {
                responseDTO = try await apiClient.get(
                    "/character",
                    as: CharacterListDTO.self
                )
            }
            return responseDTO.toEntity()
        } catch let error as RepositoryErrorType {
            if case.httpStatusCode(404) = error {
                return []
            }
            throw error
        }
    }
    
    func getCharacter(id: Int) async throws -> CharacterEntity {
        let dto: CharacterDTO = try await self.apiClient.get("/character/\(id)", as: CharacterDTO.self)
        return dto.toEntity()
    }
}
