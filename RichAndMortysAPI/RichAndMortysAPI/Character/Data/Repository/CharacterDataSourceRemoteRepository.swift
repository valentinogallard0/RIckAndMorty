//
//  CharacterDataSourceRemoteRepository.swift
//  RichAndMortysAPI
//
//  Created by Valentino De Paola Gallardo on 08/03/26.
//
import Foundation

struct CharacterDataSourceRemoteRepository: CharacterRemoteRepository {
    private let baseURL: String
    
    init(baseURL: String) {
        self.baseURL = baseURL
    }
    
    func getCharacters() async throws -> [CharacterEntity] {
        let endpoint = GetCharacterEndpoint()
        
        guard let url = URL(string: baseURL + endpoint.path) else {
            throw RepositoryErrorType.invalidURL
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let httpResponse = response as? HTTPURLResponse else {
            throw RepositoryErrorType.invalidResponse
        }
        
        guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
            throw RepositoryErrorType.httpStatusCode(httpResponse.statusCode)
        }
        
        let dto = try JSONDecoder().decode(CharacterListDTO.self, from: data)
        return dto.results.map { $0.toEntity() }
    }
}
