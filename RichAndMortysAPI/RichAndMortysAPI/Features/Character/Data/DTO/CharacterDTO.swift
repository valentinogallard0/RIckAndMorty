//
//  CharacterDTO.swift
//  RichAndMortysAPI
//
//  Created by Valentino De Paola Gallardo on 08/03/26.
//
import Foundation

struct CharacterDTO: Decodable {
    let id: Int
    let name: String
    let status: String
    let species: String
    let image: URL
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case status
        case species
        case image
    }
    
    func toEntity() -> CharacterEntity {
        return CharacterEntity(
            id: self.id,
            name: self.name,
            status: self.status,
            species: self.species,
            image: self.image
        )
    }
}
