//
//  HomeDataSourceTest.swift
//  PokedexTests
//
//  Created by Michel Torres Alonso on 12/06/22.
//

import XCTest
@testable import Pokedex

final class HomeDataSourceTest: XCTestCase {

    let pokemons = [
        Pokemon(name: "charizard", url: ""),
        Pokemon(name: "pikachu", url: "")
    ]
    
    private var dataSource: PokedexCollectionViewDataSource!
    private var collectionView: UICollectionView!
    
    override func setUp() {
        dataSource = PokedexCollectionViewDataSource(pokemons: pokemons)
        collectionView = UICollectionView(frame: CGRect(x: 0, y: 0, width: 100, height: 100), collectionViewLayout: UICollectionViewFlowLayout())
        collectionView.register(UINib(nibName: "PokemonCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "PokemonCollectionViewCell")
        collectionView.dataSource = dataSource
        super.setUp()
    }

    override func tearDown() {
        collectionView = nil
        dataSource = nil
        super.tearDown()
    }

    func testCollectionViewDataSource() {
        collectionView.reloadData()
        
        XCTAssertEqual(collectionView.numberOfSections, 1)
        XCTAssertEqual(collectionView.numberOfItems(inSection: 0), 2)
    }
}
