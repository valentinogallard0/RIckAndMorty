//
//  AppContainerCharacter.swift
//  RichAndMortysAPI
//
//  Created by Valentino De Paola Gallardo on 14/03/26.
//

extension AppContainer {
    func makeCharactersView() -> CharactersView {
        let repository = CharacterDataSourceRemoteRepository(apiClient: apiClient)
        let useCase = GetCharactersUseCase(repository: repository)
        let viewModel = CharactersViewModel(getCharactersUseCase: useCase)
        return CharactersView(viewModel: viewModel)
    }
}
