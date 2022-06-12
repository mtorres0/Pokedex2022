//
//  PokemonDetailInteractor.swift
//  Pokedex
//
//  Created Michel Torres Alonso on 11/06/22.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//
//  Template generated by Juanpe Catalán @JuanpeCMiOS
//

import UIKit

class PokemonDetailInteractor: PokemonDetailInteractorProtocol {
    
    weak var presenter: PokemonDetailPresenterProtocol?
    
    func getPokemonInfo(id: Int) {
        let request = PokedexFeed.pokemonDetail(id).request
        PokedexClient.shared.fetch(with: request, completion: handlePokemonDetailResults(result:))
    }
    
    private func handlePokemonDetailResults(result: Result<PokemonDetail, APIError>) {
        switch result {
        case .success(let pokemon):
            presenter?.showPokemonInfo(pokemon: pokemon)
        case .failure(let error):
            print("the error \(error)")
        }
    }
}