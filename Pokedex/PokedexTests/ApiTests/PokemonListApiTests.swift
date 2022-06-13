//
//  PokemonListApiTests.swift
//  PokedexTests
//
//  Created by Michel Torres Alonso on 12/06/22.
//

import XCTest
@testable import Pokedex

final class PokemonListApiTests: XCTestCase {

    private var request: URLRequest!
    
    override func setUp() {
        super.setUp()
        request = PokedexFeed.pokemonList(0, 20).request
    }

    override func tearDown() {
        request = nil
        super.tearDown()
    }
    
    func testSimilarMoviesURL() throws {
        XCTAssertEqual(request.url?.host, "pokeapi.co")
        XCTAssertEqual(request.url?.path, "/api/v2/pokemon")
        XCTAssertEqual(request.url?.query, "offset=0&limit=20")
        XCTAssertEqual(request.url?.absoluteString, "https://pokeapi.co/api/v2/pokemon?offset=0&limit=20")
    }
    
    func testGetPokemonListAPI() throws {
        let expectation = self.expectation(description: "get pokemon list")
        PokedexClient.shared.fetch(with: request) { (result: Result<PokedexResult, APIError>) in
            expectation.fulfill()
            switch result {
            case .success(let pokemon):
                XCTAssertNotNil(pokemon)
                XCTAssertGreaterThanOrEqual(pokemon.count, 0)
            case .failure(let error):
                XCTFail("API error \(error.localizedDescription)")
            }
        }
        wait(for: [expectation], timeout: 5)
    }
}
