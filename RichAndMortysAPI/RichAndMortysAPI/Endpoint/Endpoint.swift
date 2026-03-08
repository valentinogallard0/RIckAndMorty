//
//  Endpoint.swift
//  RichAndMortysAPI
//
//  Created by Valentino De Paola Gallardo on 08/03/26.
//

protocol Endpoint {
    var path: String { get }
    var method: HTTPMethod { get }
}


enum HTTPMethod {
    case get
}
