//
//  PokemonDetailPresenter.swift
//  Pokedex
//
//  Created Michel Torres Alonso on 11/06/22.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//
//  Template generated by Juanpe Catalán @JuanpeCMiOS
//

import UIKit

class PokemonDetailPresenter: PokemonDetailPresenterProtocol {
    
    var pokemon: PokemonDetail? = nil
    
    
    weak private var view: PokemonDetailViewProtocol?
    var interactor: PokemonDetailInteractorProtocol?
    private let router: PokemonDetailWireframeProtocol

    init(interface: PokemonDetailViewProtocol, interactor: PokemonDetailInteractorProtocol?, router: PokemonDetailWireframeProtocol) {
        self.view = interface
        self.interactor = interactor
        self.router = router
    }

    func getPokemonInfo(id: Int) {
        interactor?.getPokemonInfo(id: id)
    }
    
    func showPokemonInfo(pokemon: PokemonDetail) {
        self.pokemon = pokemon
        view?.showPokemonInfo()
    }
    
    func goToTypePokemon(_ type: PokemonType) {
        router.goToTypePokemon(type)
    }
    
    func showErrorMessage() {
        view?.showErrorMessage()
    }
}
