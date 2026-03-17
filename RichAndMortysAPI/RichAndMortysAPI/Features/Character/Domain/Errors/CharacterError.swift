//
//  CharacterError.swift
//  RichAndMortysAPI
//
//  Created by Valentino De Paola Gallardo on 12/03/26.
//
import Foundation

enum CharacterError: LocalizedError {
    case emptyCharacters
    case invalidID
    
    var errorDescription: String? {
        switch self {
        case .emptyCharacters:
            return "No se encontraron personajes."
        case .invalidID:
            return "ID inválido."
        }
    }
}
