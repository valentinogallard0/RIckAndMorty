//
//  CharacterDTO.swift
//  RichAndMortysAPI
//
//  Created by Valentino De Paola Gallardo on 08/03/26.
//

struct CharacterDTO: Decodable {
    let id: Int
    let name: String
    let status: String
    let species: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case status
        case species
    }
    
    func toEntity() -> CharacterEntity {
        return CharacterEntity(
            id: self.id,
            name: self.name,
            status: self.status,
            species: self.species)
    }
}
