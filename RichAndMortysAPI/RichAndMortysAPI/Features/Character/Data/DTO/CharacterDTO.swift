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
    let gender: String
    let image: URL
    let origin: CharacterOriginDTO
    let location: CharacterLocationDTO
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case status
        case species
        case gender
        case image
        case origin
        case location
    }
    
    func toEntity() -> CharacterEntity {
        return CharacterEntity(
            id: self.id,
            name: self.name,
            status: self.status,
            species: self.species,
            gender: self.gender,
            image: self.image,
            origin: self.origin.toEntity(),
            location: self.location.toEntity()
        )
    }
}
