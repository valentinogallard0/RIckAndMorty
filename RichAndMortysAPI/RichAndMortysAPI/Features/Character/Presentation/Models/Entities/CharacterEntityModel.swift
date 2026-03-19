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
    let gender: String
    let image: URL
    let origin: CharacterOriginEntityModel
    let location: CharacterLocationEntityModel
}

extension CharacterEntityModel {
    static func toObject(fromData entity: CharacterEntity) -> CharacterEntityModel {
        return CharacterEntityModel(
            id: entity.id,
            name: entity.name,
            status: entity.status,
            species: entity.species,
            gender: entity.gender,
            image: entity.image,
            origin: CharacterOriginEntityModel.toObject(fromData: entity.origin),
            location: CharacterLocationEntityModel.toObject(from: entity.location)
        )
    }
}
