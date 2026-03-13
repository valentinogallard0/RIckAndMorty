//
//  RepositoryError.swift
//  RichAndMortysAPI
//
//  Created by Valentino De Paola Gallardo on 08/03/26.
//


enum RepositoryErrorType: Error {
    case invalidURL
    case invalidResponse
    case httpStatusCode(Int)
    
    var description: String {
        switch self {
        case .invalidURL:
            return "Invalid URL"
        case .invalidResponse:
            return "Invalid response"
        case .httpStatusCode(let code):
            return "HTTP error with status code: \(code)"
        }
    }
}
