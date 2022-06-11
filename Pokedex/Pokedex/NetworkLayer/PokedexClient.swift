//
//  PokedexClient.swift
//  TheMovieDb
//
//  Created by Michel Torres Alonso on 21/11/21.
//

import Foundation

final class PokedexClient: APIClient {
    
    static var shared = PokedexClient(configuration: .default)
    
    let session: URLSession
    
    private init(configuration: URLSessionConfiguration) {
        self.session = URLSession(configuration: configuration)
    }
}
