//
//  RichAndMortysAPIApp.swift
//  RichAndMortysAPI
//
//  Created by Valentino De Paola Gallardo on 08/03/26.
//

import SwiftUI

@main
struct RichAndMortysAPIApp: App {
    private let container = AppContainer()
    
    var body: some Scene {
        WindowGroup {
            container.makeCharacterView()
        }
    }
}
