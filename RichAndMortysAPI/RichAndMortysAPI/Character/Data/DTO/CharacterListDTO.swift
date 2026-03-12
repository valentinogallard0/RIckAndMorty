//
//  CharacterListDTO.swift
//  RichAndMortysAPI
//
//  Created by Valentino De Paola Gallardo on 11/03/26.
//

struct CharacterListDTO: Decodable {
    let results: [CharacterDTO]
    
    func toEntity() -> [CharacterEntity] {
        return self.results.map { $0.toEntity() }
    }
}
