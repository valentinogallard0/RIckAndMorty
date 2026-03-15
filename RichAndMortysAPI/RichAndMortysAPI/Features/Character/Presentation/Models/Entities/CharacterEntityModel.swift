//
//  CharacterEntityModel.swift
//  RichAndMortysAPI
//
//  Created by Valentino De Paola Gallardo on 13/03/26.
//
import Foundation

struct CharacterEntityModel: Identifiable {
    let id: Int
    let name: String
    let status: String
    let species: String
    let image: URL
}

extension CharacterEntityModel {
    static func toObject(fromData entity: CharacterEntity) -> CharacterEntityModel {
        return CharacterEntityModel(
            id: entity.id,
            name: entity.name,
            status: entity.status,
            species: entity.species,
            image: entity.image
        )
    }
}
