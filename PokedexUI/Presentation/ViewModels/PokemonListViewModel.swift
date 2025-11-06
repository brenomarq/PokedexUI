//
//  PokemonListViewModel.swift
//  PokedexUI
//
//  Created by Breno Marques on 16/10/25.
//

import Foundation
import Combine

@MainActor
class PokemonListViewModel: ObservableObject {
    @Published var pokemons: [Pokemon] = []
    @Published var isLoading: Bool = false
    @Published var errorMessage: String? = nil
    
    private let getAllPokemonsUseCase: GetAllPokemonsUseCase = .init()
    
    func loadPokemons(offset: Int, limit: Int) async {
        isLoading = true
        errorMessage = nil
        
        do {
            let result = try await getAllPokemonsUseCase.execute(offset: offset, limit: limit)
            self.pokemons = result
        } catch {
            errorMessage = "An error has occured: \(error.localizedDescription)"
        }
        
        isLoading = false
    }
    
}
