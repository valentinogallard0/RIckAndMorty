//
//  CharacterEntity.swift
//  RichAndMortysAPI
//
//  Created by Valentino De Paola Gallardo on 08/03/26.
//
import Foundation

struct CharacterEntity {
    let id: Int
    let name: String
    let status: String
    let species: String
    let gender: String
    let image: URL
    let origin: CharacterOriginEntity
    let location: CharacterLocationEntity
}
