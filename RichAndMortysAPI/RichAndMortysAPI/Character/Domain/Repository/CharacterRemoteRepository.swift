//
//  CharacterRemoteRepository.swift
//  RichAndMortysAPI
//
//  Created by Valentino De Paola Gallardo on 08/03/26.
//

protocol CharacterRepository {
    func getCharacters() async throws -> [CharacterEntity]
    func getCharacter(id: Int) async throws -> CharacterEntity
}
