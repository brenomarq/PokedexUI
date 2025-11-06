//
//  GetAllPokemonsUseCase.swift
//  PokedexUI
//
//  Created by Breno Marques on 16/10/25.
//

import Foundation

class GetAllPokemonsUseCase {
    
    let pokemonRepository: PokemonRepository = .init()
    
    func execute(offset: Int, limit: Int) async throws -> [Pokemon] {
        return try await pokemonRepository.getPokemon(offset: offset, limit: limit)
    }
    
}
