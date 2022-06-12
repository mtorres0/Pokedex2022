//
//  PokemonDetail.swift
//  Pokedex
//
//  Created by Michel Torres Alonso on 11/06/22.
//

import Foundation

struct PokemonDetail: Codable {
    var name: String?
    var sprites: PokemonSprite?
    var stats: [PokemonStats]?
    var types: [PokemonTypes]?
}

struct PokemonSprite: Codable {
    var frontDefault: String?
    var frontShiny: String?
    
    enum CodingKeys: String, CodingKey {
        case frontDefault = "front_default"
        case frontShiny = "front_shiny"
    }
}

struct PokemonStats: Codable {
    var baseStat: Int?
    var effort: Int?
    var stat: PokemonStat?
    
    enum CodingKeys: String, CodingKey {
        case baseStat = "base_stat"
        case effort
        case stat
    }
}

struct PokemonStat: Codable {
    var name: String?
    var url: String?
}

struct PokemonTypes: Codable {
    var slot: Int?
    var type: PokemonType?
}

struct PokemonType: Codable {
    var name: String?
    var url: String?
}
