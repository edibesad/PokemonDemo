//
//  ContentView.swift
//  PokemonDemo
//
//  Created by Edib Esad Galip on 13.03.2024.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = ViewModel()
    
    
    private let adaptiveColumns = [
        GridItem(.adaptive(minimum: 150))
    ]

    var body: some View {
        
        NavigationView{
            ScrollView{
                LazyVGrid(columns: adaptiveColumns, spacing: 10) {
                    ForEach(viewModel.filteredPokemon) {
                        pokemon in NavigationLink(
                            destination: PokemonDetailView(pokemon: pokemon))
                        {
                            PokemonView(pokemon: pokemon)
                        }
                        
                    }.environmentObject(viewModel)
                }.animation(.easeIn(duration: 0.3), value: viewModel.filteredPokemon.count)
                    .navigationTitle("PokemonUI")
                    .navigationBarTitleDisplayMode(.inline)
                    .searchable(text: $viewModel.searchText)
            }
        }.environmentObject(viewModel)
    }
}

#Preview {
    ContentView().environmentObject(ViewModel())
}
