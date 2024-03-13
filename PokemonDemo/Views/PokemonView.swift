//
//  PokemonView.swift
//  PokemonDemo
//
//  Created by Edib Esad Galip on 13.03.2024.
//

import SwiftUI

struct PokemonView: View {
    @EnvironmentObject var viewModel : ViewModel
    let pokemon: Pokemon
    let dimensions: Double = 140
    
    
    var body: some View {
        VStack {
            AsyncImage(url: URL(string: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/\(viewModel.getPokemonIndex(pokemon: pokemon)).png")) { image in
                image
                    .resizable()
                    .scaledToFit()
                    .frame(width: dimensions, height: dimensions)
            } placeholder: {
                ProgressView().frame(width: dimensions, height: dimensions)
            }
            Text("\(pokemon.name.capitalized)")
                .font(.system(size: 16, weight: .regular, design: .monospaced))
                .padding(.bottom, 20)
        }
    }
    
}
    #Preview {
        PokemonView(pokemon: .samplePokemon).environmentObject(ViewModel())
    }

