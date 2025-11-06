//
//  PokemonAPIDataSource.swift
//  PokedexUI
//
//  Created by Breno Marques on 16/10/25.
//

import Foundation

enum PokemonAPIDataSourceError: Error {
    case invalidURL
    case invalidResponse
    case parsingError
}

class PokemonAPIDataSource {
    
    func getPokemon(offset: Int, limit: Int) async throws -> PokemonListDTO {
        guard let url = URL(string: "https://pokeapi.co/api/v2/pokemon/?offset=\(offset)&limit=\(limit)") else {
            throw PokemonAPIDataSourceError.invalidURL
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw PokemonAPIDataSourceError.invalidResponse
        }
        
        do {
            let list = try JSONDecoder().decode(PokemonListDTO.self, from: data)
            return list
        } catch {
            print(error.localizedDescription)
            throw PokemonAPIDataSourceError.parsingError
        }
    }
    
    func getPokemonDetails(id: String) async throws -> PokemonDTO {
        guard let url = URL(string: "https://pokeapi.co/api/v2/pokemon/\(id)/") else {
            throw PokemonAPIDataSourceError.invalidURL
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw PokemonAPIDataSourceError.invalidResponse
        }
        
        do {
            let pokemon = try JSONDecoder().decode(PokemonDTO.self, from: data)
            return pokemon
        } catch {
            print(error.localizedDescription)
            throw PokemonAPIDataSourceError.parsingError
        }
    }
    
}
