//
//  PokemonTypeResults.swift
//  Pokedex
//
//  Created by Michel Torres Alonso on 12/06/22.
//

import Foundation

struct PokemonTypeResults: Codable {
    var name: String?
    var pokemon: [PokemonSlot]?
}

struct PokemonSlot: Codable {
    var slot: Int?
    var pokemon: Pokemon
}
