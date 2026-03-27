//
//  ApiClient.swift
//  RichAndMortysAPI
//
//  Created by Valentino De Paola Gallardo on 11/03/26.
//

import Foundation

final class APIClient {
    
    private let baseURL: String
    private let session: URLSession
    private let decoder: JSONDecoder
    
    init(
        baseURL: String = AppConfiguration.apiBaseURL,
        session: URLSession = .shared,
        decoder: JSONDecoder = JSONDecoder()
    ) {
        let trimmedBaseURL: String = baseURL.trimmingCharacters(in: .whitespacesAndNewlines)
        self.baseURL = trimmedBaseURL.hasSuffix("/") ? String(trimmedBaseURL.dropLast()) : trimmedBaseURL
        self.session = session
        self.decoder = decoder
    }
    
    func get<T: Decodable> (_ path: String, queryItems: [URLQueryItem] = [], as type: T.Type) async throws -> T {
        let normalizedPath: String = path.hasPrefix("/") ? path : "/\(path)"

        guard var components = URLComponents(string: self.baseURL) else { throw RepositoryErrorType.invalidURL }
        components.path += normalizedPath
        components.queryItems = queryItems.isEmpty ? nil : queryItems
        
        guard let url: URL = components.url else { throw RepositoryErrorType.invalidURL }
        
        let (data, response): (Data, URLResponse) = try await self.session.data(from: url)
        
        guard let httpResponse: HTTPURLResponse = response as? HTTPURLResponse else { throw RepositoryErrorType.invalidResponse }
        
        guard 200...299 ~= httpResponse.statusCode else {
            throw RepositoryErrorType.httpStatusCode(httpResponse.statusCode)
        }
        
        return try self.decoder.decode(T.self, from: data)
    }
}
