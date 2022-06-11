//
//  PokedexResult.swift
//  Pokedex
//
//  Created by Michel Torres Alonso on 11/06/22.
//

import Foundation

struct PokedexResult: Codable {
    let count: Int
    let results: [Pokemon]?
}


struct Pokemon: Codable {
    let name: String
    let url: String
}
