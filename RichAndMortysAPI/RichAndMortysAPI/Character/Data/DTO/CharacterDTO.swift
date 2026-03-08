//
//  CharacterDTO.swift
//  RichAndMortysAPI
//
//  Created by Valentino De Paola Gallardo on 08/03/26.
//

final class CharacterDTO {
    private(set) var id: Int
    private(set) var name: String
    private(set) var status: String
    private(set) var species: String
    
    init(id: Int, name: String, status: String, species: String) {
        self.id = id
        self.name = name
        self.status = status
        self.species = species
    }
    
    static func toObject(fromData data: Any?) -> CharacterDTO? {
        guard let data: [String: Any] = data as? [String: Any] else {
            return nil
        }
        
        return .init(
            id: data["id"] as? Int ?? 0,
            name: data["name"] as? String ?? "",
            status: data["status"] as? String ?? "",
            species: data["species"] as? String ?? ""
        )
    }
    
    func toEntity() -> CharacterEntity {
        return .init(
            id: self.id,
            name: self.name,
            status: self.status,
            species: self.species
        )
    }
}
