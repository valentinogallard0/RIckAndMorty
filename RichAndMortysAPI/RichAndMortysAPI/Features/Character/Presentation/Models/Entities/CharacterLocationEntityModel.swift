//
//  CharacterLocationEntityModel.swift
//  RichAndMortysAPI
//
//  Created by Valentino De Paola Gallardo on 18/03/26.
//

struct CharacterLocationEntityModel {
    let name: String
    let url: String
}

extension CharacterLocationEntityModel {
    static func toObject(from entity: CharacterLocationEntity) -> CharacterLocationEntityModel {
        CharacterLocationEntityModel(
            name: entity.name,
            url: entity.url
        )
    }
}
