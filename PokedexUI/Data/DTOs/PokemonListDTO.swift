//
//  PokemonResultDTO.swift
//  PokedexUI
//
//  Created by Breno Marques on 15/10/25.
//

import Foundation

struct PokemonResultDTO: Decodable {
    let name: String
    let url: String
}

struct PokemonListDTO: Decodable {
    let count: Int
    let next: String
    let results: [PokemonResultDTO]
}
