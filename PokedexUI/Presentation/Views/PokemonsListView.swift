//
//  PokemonsListView.swift
//  PokedexUI
//
//  Created by Breno Marques on 16/10/25.
//

import SwiftUI

struct PokemonsListView: View {
    @StateObject private var viewModel = PokemonListViewModel()
    
    var body: some View {
        NavigationView {
            Group {
                if viewModel.isLoading {
                    ProgressView("Loading...")
                } else if let error = viewModel.errorMessage {
                    Text(error)
                        .foregroundStyle(.red)
                        .multilineTextAlignment(.center)
                        .padding()
                } else {
                    List(viewModel.pokemons) { pokemon in
                        HStack {
                            AsyncImage(url: URL(string: pokemon.imageURL)) { view in
                                view
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 60, height: 60)
                            } placeholder: {
                                ProgressView()
                            }

                            
                            VStack(alignment: .leading) {
                                Text(pokemon.name.capitalized)
                                    .font(.headline)
                                Text("Height: \(pokemon.height), Weight: \(pokemon.weight)")
                                    .font(.headline)
                                    .foregroundStyle(.gray)
                            }
                        }
                    }
                }
            }
            .navigationTitle("Pokémons")
            .task {
                await viewModel.loadPokemons(offset: 0, limit: 20)
            }
        }
    }
}

#Preview {
    PokemonsListView()
}
