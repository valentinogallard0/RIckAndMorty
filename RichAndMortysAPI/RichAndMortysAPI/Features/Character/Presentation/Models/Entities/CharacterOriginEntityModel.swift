//
//  CharacterOriginEntityModel.swift
//  RichAndMortysAPI
//
//  Created by Valentino De Paola Gallardo on 16/03/26.
//

struct CharacterOriginEntityModel {
    let name: String
    let url: String
}

extension CharacterOriginEntityModel {
    static func toObject(fromData entity: CharacterOriginEntity) -> CharacterOriginEntityModel {
        CharacterOriginEntityModel(
            name: entity.name,
            url: entity.url
        )
    }
}
