//
//  AppContainer.swift
//  RichAndMortysAPI
//
//  Created by Valentino De Paola Gallardo on 14/03/26.
//

final class AppContainer {
    lazy var apiClient: APIClient = {
        APIClient()
    }()
}
