//
//  CharacterLocationDTO.swift
//  RichAndMortysAPI
//
//  Created by Valentino De Paola Gallardo on 18/03/26.
//

struct CharacterLocationDTO: Decodable {
    let name: String
    let url: String
    
    enum CodingKeys: String, CodingKey {
        case name
        case url
    }
    
    func toEntity() -> CharacterLocationEntity {
        CharacterLocationEntity(
            name: self.name,
            url: self.url
        )
    }
}


