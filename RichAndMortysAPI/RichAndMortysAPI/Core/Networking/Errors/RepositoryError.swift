//
//  RepositoryError.swift
//  RichAndMortysAPI
//
//  Created by Valentino De Paola Gallardo on 08/03/26.
//

import Foundation

enum RepositoryErrorType: LocalizedError {
    case invalidURL
    case invalidResponse
    case httpStatusCode(Int)
    
    var errorDescription: String? {
        switch self {
        case .invalidURL:
            return "La URL del servicio es invalida."
        case .invalidResponse:
            return "La respuesta del servidor no es valida."
        case .httpStatusCode(let code):
            return "Error HTTP con codigo de estado: \(code)."
        }
    }
    
    var description: String {
        self.errorDescription ?? "Error de repositorio."
    }
}
