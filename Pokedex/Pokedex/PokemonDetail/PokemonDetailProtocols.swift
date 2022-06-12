//
//  PokemonDetailProtocols.swift
//  Pokedex
//
//  Created Michel Torres Alonso on 11/06/22.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//
//  Template generated by Juanpe Catalán @JuanpeCMiOS
//

import Foundation

//MARK: Wireframe -
protocol PokemonDetailWireframeProtocol: AnyObject {
    
}
//MARK: Presenter -
protocol PokemonDetailPresenterProtocol: AnyObject {
    var pokemon: PokemonDetail? { get set }
    
    func getPokemonInfo(id: Int)
    func showPokemonInfo(pokemon: PokemonDetail)
}

//MARK: Interactor -
protocol PokemonDetailInteractorProtocol: AnyObject {

    var presenter: PokemonDetailPresenterProtocol?  { get set }
    func getPokemonInfo(id: Int)
}

//MARK: View -
protocol PokemonDetailViewProtocol: AnyObject {

    var presenter: PokemonDetailPresenterProtocol?  { get set }
    func showPokemonInfo()
}