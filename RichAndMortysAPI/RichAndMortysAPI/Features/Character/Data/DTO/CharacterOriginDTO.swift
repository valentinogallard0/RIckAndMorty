//
//  CharacterOriginDTO.swift
//  RichAndMortysAPI
//
//  Created by Valentino De Paola Gallardo on 16/03/26.
//

struct CharacterOriginDTO: Decodable {
    let name: String
    let url: String
    
    enum CodingKeys: String, CodingKey {
        case name
        case url
    }

    func toEntity() -> CharacterOriginEntity {
        CharacterOriginEntity(
            name: self.name,
            url: self.url
        )
    }
}
