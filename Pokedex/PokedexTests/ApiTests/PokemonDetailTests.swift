//
//  PokemonDetailTests.swift
//  PokedexTests
//
//  Created by Michel Torres Alonso on 12/06/22.
//

import XCTest
@testable import Pokedex

class PokemonDetailTests: XCTestCase {

    private var request: URLRequest!
    private var pokemonId: Int = 6 // id for charizard
    
    override func setUp() {
        super.setUp()
        request = PokedexFeed.pokemonDetail(pokemonId).request
    }

    override func tearDown() {
        request = nil
        super.tearDown()
    }
    
    func testSimilarMoviesURL() throws {
        XCTAssertEqual(request.url?.host, "pokeapi.co")
        XCTAssertEqual(request.url?.path, "/api/v2/pokemon/\(pokemonId)")
        XCTAssertEqual(request.url?.absoluteString, "https://pokeapi.co/api/v2/pokemon/\(pokemonId)")
    }
    
    func testGetPokemonListAPI() throws {
        let expectation = self.expectation(description: "get pokemon by id")
        PokedexClient.shared.fetch(with: request) { (result: Result<PokemonDetail, APIError>) in
            expectation.fulfill()
            switch result {
            case .success(let pokemon):
                XCTAssertNotNil(pokemon)
                XCTAssertEqual(pokemon.name, "charizard")
                XCTAssertNotNil(pokemon.sprites)
                XCTAssertNotNil(pokemon.stats)
                XCTAssertNotNil(pokemon.types)
            case .failure(let error):
                XCTFail("API error \(error.localizedDescription)")
            }
        }
        wait(for: [expectation], timeout: 5)
    }
}
