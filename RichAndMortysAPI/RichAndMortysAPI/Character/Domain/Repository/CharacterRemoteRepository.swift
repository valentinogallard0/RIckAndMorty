//
//  CharacterRemoteRepository.swift
//  RichAndMortysAPI
//
//  Created by Valentino De Paola Gallardo on 08/03/26.
//

protocol CharacterRemoteRepository {
    func getCharacters() async throws -> [CharacterEntity]
}
