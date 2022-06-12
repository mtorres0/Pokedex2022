//
//  PokedexInteractor.swift
//  Pokedex
//
//  Created Michel Torres Alonso on 11/06/22.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//
//  Template generated by Juanpe Catalán @JuanpeCMiOS
//

import UIKit

class PokedexInteractor: PokedexInteractorProtocol {
    
    weak var presenter: PokedexPresenterProtocol?
    
    func getPokemons(offset: Int, limit: Int) {
        let request = PokedexFeed.pokemonList(offset, limit).request
        PokedexClient.shared.fetch(with: request, completion: handlePokedexResults(result:))
    }
    
    private func handlePokedexResults(result: Result<PokedexResult, APIError>) {
        switch result {
        case .success(let pokedex):
            guard let pokemonList = pokedex.results else { return }
            presenter?.showPokemons(pokemons: pokemonList)
        case .failure(let error):
            print("the error \(error)")
        }
    }
    
    func getPokemonByType(url: String) {
        guard let typeUrl = URL(string: url) else { return }
        let request = URLRequest(url: typeUrl)
        PokedexClient.shared.fetch(with: request, completion: handlePokedexTypeResults(result:))
    }
    
    private func handlePokedexTypeResults(result: Result<PokemonTypeResults, APIError>) {
        switch result {
        case .success(let pokemonTypeResult):
            guard let pokemonSlots = pokemonTypeResult.pokemon else { return }
            let pokemonList = pokemonSlots.map { $0.pokemon }
            presenter?.showPokemons(pokemons: pokemonList)
        case .failure(let error):
            print("the error \(error)")
        }
    }
}
