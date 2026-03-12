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
        baseURL: String = "https://rickandmortyapi.com/api",
        session: URLSession = .shared,
        decoder: JSONDecoder = JSONDecoder()
    ) {
        self.baseURL = baseURL
        self.session = session
        self.decoder = decoder
    }
    
    func get<T: Decodable> (_ path: String, as type: T.Type) async throws -> T {
        guard let url: URL = URL(string: self.baseURL + path) else { throw URLError(.badURL) }
        
        let (data, response): (Data, URLResponse) = try await self.session.data(from: url)
        
        guard let httpResponse: HTTPURLResponse = response as? HTTPURLResponse else { throw URLError(.badServerResponse)}
        
        guard 200...299 ~= httpResponse.statusCode else {
            throw URLError(.badServerResponse)
        }
        
        return try self.decoder.decode(T.self, from: data)
    }
}
