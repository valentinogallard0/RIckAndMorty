//
//  CharactersViewModel.swift
//  RichAndMortysAPI
//
//  Created by Valentino De Paola Gallardo on 13/03/26.
//

import Foundation
import SwiftUI
import Combine

@MainActor
final class CharactersViewModel: ObservableObject {
    @Published var searchText: String = ""
    @Published private(set) var characters: [CharacterEntityModel] = []
    @Published private(set) var isLoading: Bool = false
    @Published var errorMessage: String?
    
    private var cancellables = Set<AnyCancellable>()
    private var searchTask: Task<Void, Never>?
    
    private let getCharactersUseCase: GetCharactersUseCase
    
    init(getCharactersUseCase: GetCharactersUseCase) {
        self.getCharactersUseCase = getCharactersUseCase
        bindSearchText()
    }
    
    private func bindSearchText() {
        $searchText
            .map { $0.trimmingCharacters(in: .whitespacesAndNewlines) }
            .removeDuplicates()
            .dropFirst()
            //Espera antes de hacer la llamada a la API
            .debounce(for: .milliseconds(350), scheduler: RunLoop.main)
            .sink { [weak self] query in
                //evita que una busqueda vieja te pise una nueva
                self?.searchTask?.cancel()
                self?.searchTask = Task { [weak self] in
                    await self?.loadCharacters(name: query.isEmpty ? nil : query)
                }
            }
            .store(in: &cancellables)
    }
    
    func loadCharactersIfNeeded() async {
        guard characters.isEmpty, !isLoading else { return }
        await loadCharacters(name: nil)
    }
    
    func loadCharacters(name: String? = nil) async {
        let trimmedName = name?.trimmingCharacters(in: .whitespacesAndNewlines)
        let normalizedName = trimmedName?.isEmpty == true ? nil: trimmedName
        
        isLoading = true
        errorMessage = nil
        
        defer { isLoading = false }
        
        do {
            let entities = try await getCharactersUseCase.execute(name: normalizedName)
            
            guard !Task.isCancelled else { return }
            
            characters = entities.map{ CharacterEntityModel.toObject(fromData: $0)}
        } catch {
            guard !Task.isCancelled else { return }
            errorMessage = error.localizedDescription
        }
    }
}
