//
//  AppConfiguration.swift
//  RichAndMortysAPI
//
//  Created by Valentino De Paola Gallardo on 13/03/26.

import Foundation

enum AppConfiguration {
    private static let apiBaseURLKey: String = "API_BASE_URL"
    
    static var apiBaseURL: String {
        guard let apiBaseURL: String = Bundle.main.object(forInfoDictionaryKey: self.apiBaseURLKey) as? String else {
            preconditionFailure("Missing \(self.apiBaseURLKey) in the app configuration.")
        }
        
        let trimmedValue: String = apiBaseURL.trimmingCharacters(in: .whitespacesAndNewlines)
        precondition(!trimmedValue.isEmpty, "\(self.apiBaseURLKey) cannot be empty.")
        
        return trimmedValue
    }
}
