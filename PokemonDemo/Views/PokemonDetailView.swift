//
//  PokemonDetailView.swift
//  PokemonDemo
//
//  Created by Edib Esad Galip on 13.03.2024.
//

import SwiftUI

struct PokemonDetailView: View {
    @EnvironmentObject var viewModel: ViewModel
    let pokemon: Pokemon
    
    
    var body: some View {
        PokemonView(pokemon: pokemon)
        
        VStack(spacing: 10) {
            Text("**ID**: \(viewModel.pokemonDetails?.weight ?? 0) ")
            Text("**Height**: \(viewModel.formatHW(value: viewModel.pokemonDetails?.height ?? 0))")
            Text("**Weight**: \(viewModel.formatHW(value: viewModel.pokemonDetails?.weight ?? 0))")
        }
    }
}

#Preview {
    PokemonDetailView(pokemon: .samplePokemon).environmentObject(ViewModel())
}
