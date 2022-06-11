//
//  MovieFeed.swift
//  TheMovieDb
//
//  Created by Michel Torres Alonso on 21/11/21.
//

import Foundation

enum PokedexFeed {
    case pokemonList(Int, Int)
}
extension PokedexFeed: Endpoint {
    var base: String {
        return "https://pokeapi.co/"
    }
    
    var path: String {
        switch self {
        case .pokemonList: return "/api/v2/pokemon"
        }
    }
    
    var urlComponents: URLComponents {
        var components = URLComponents(string: base)!
        components.path = path
        var queryItems = [URLQueryItem]()
        switch self {
        case .pokemonList(let offset, let limit):
            queryItems.append(URLQueryItem(name: "offset", value: "\(offset)"))
            queryItems.append(URLQueryItem(name: "limit", value: "\(limit)"))
        }
        components.queryItems = queryItems
        return components
    }
    
    var request: URLRequest {
        let url = urlComponents.url!
        return URLRequest(url: url)
    }

}
