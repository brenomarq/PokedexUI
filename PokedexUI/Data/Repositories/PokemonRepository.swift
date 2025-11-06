//
//  PokemonRepository.swift
//  PokedexUI
//
//  Created by Breno Marques on 16/10/25.
//

import Foundation

class PokemonRepository {
    
    let pokemonDataSource: PokemonAPIDataSource = .init()
    
    func getPokemon(offset: Int, limit: Int) async throws -> [Pokemon] {
        do {
            // Get the pokemon list
            let pokemonListDTO = try await pokemonDataSource.getPokemon(offset: offset, limit: limit)
            
            // For every pokemon, we get the details
            var pokemons: [Pokemon] = []
            
            for pokemonResultDTO in pokemonListDTO.results {
                let pokemonID = pokemonResultDTO.url.split(separator: "/").last ?? "1"
                let pokemonDTO = try await pokemonDataSource.getPokemonDetails(id: String(pokemonID))
                let newPokemon = PokemonMapper.generatePokemon(pokemonResultDTO: pokemonResultDTO, pokemonDTO: pokemonDTO)
                pokemons.append(newPokemon)
            }
            
            return pokemons
        } catch {
            throw error
        }
    }
    
}
