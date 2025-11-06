//
//  PokemonDTO.swift
//  PokedexUI
//
//  Created by Breno Marques on 15/10/25.
//

import Foundation

struct PokemonDTO: Codable {
    let id: Int
    let name: String
    let height: Int
    let weight: Int
}
