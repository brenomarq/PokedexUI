//
//  PokemonMapper.swift
//  PokedexUI
//
//  Created by Breno Marques on 16/10/25.
//

import Foundation

class PokemonMapper {
    
    static func generatePokemon(pokemonResultDTO: PokemonResultDTO, pokemonDTO: PokemonDTO) -> Pokemon {
        return Pokemon(
            name: pokemonDTO.name,
            url: pokemonResultDTO.url,
            weight: pokemonDTO.weight,
            height: pokemonDTO.height
        )
    }
    
}
