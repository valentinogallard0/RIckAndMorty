//
//  GetCharacterEndpoint.swift
//  RichAndMortysAPI
//
//  Created by Valentino De Paola Gallardo on 08/03/26.
//
import Foundation

struct GetCharacterEndpoint: Endpoint {
    var path: String { "/character" }
    var method: HTTPMethod = .get
}


