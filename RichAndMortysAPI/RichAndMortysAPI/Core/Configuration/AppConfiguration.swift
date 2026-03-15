//
//  AppConfiguration.swift
//  RichAndMortysAPI
//
//  Created by Valentino De Paola Gallardo on 13/03/26.

import Foundation

enum AppConfiguration {
    private static let apiBaseURLKey: String = "API_BASE_URL"
    private static let fallbackAPIBaseURL: String = "https://rickandmortyapi.com/api"
    
    static var apiBaseURL: String {
        guard let apiBaseURL: String = Bundle.main.object(forInfoDictionaryKey: self.apiBaseURLKey) as? String else {
            assertionFailure("Missing \(self.apiBaseURLKey) in the app configuration. Falling back to the default API host.")
            return self.fallbackAPIBaseURL
        }
        
        let trimmedValue: String = apiBaseURL.trimmingCharacters(in: .whitespacesAndNewlines)
        
        guard !trimmedValue.isEmpty else {
            assertionFailure("\(self.apiBaseURLKey) cannot be empty. Falling back to the default API host.")
            return self.fallbackAPIBaseURL
        }
        
        return trimmedValue
    }
}
