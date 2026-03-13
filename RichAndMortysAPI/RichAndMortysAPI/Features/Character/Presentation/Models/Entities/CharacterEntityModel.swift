//
//  CharacterEntityModel.swift
//  RichAndMortysAPI
//
//  Created by Valentino De Paola Gallardo on 13/03/26.
//

struct CharacterEntityModel: Identifiable {
    let id: Int
    let name: String
    let status: String
    let species: String
    
    var initials: String {
        let letters: [Character] = self.name
            .split(separator: " ")
            .prefix(2)
            .compactMap(\.first)
        
        return letters.isEmpty ? "?" : String(letters).uppercased()
    }
}

extension CharacterEntityModel {
    static func toObject(fromData entity: CharacterEntity) -> CharacterEntityModel {
        return CharacterEntityModel(
            id: entity.id,
            name: entity.name,
            status: entity.status,
            species: entity.species
        )
    }
}
