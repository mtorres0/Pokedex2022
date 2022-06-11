//
//  PokedexViewController.swift
//  Pokedex
//
//  Created Michel Torres Alonso on 11/06/22.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//
//  Template generated by Juanpe Catalán @JuanpeCMiOS
//

import UIKit

class PokedexViewController: UIViewController, PokedexViewProtocol {

    @IBOutlet weak var pokemonCollectionView: UICollectionView!
    var presenter: PokedexPresenterProtocol?

	override func viewDidLoad() {
        super.viewDidLoad()
        title = "Pokedex"
        setupCollectionView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        presenter?.getPokemons()
    }
    
    func setupCollectionView() {
        pokemonCollectionView.dataSource = self
        pokemonCollectionView.register(UINib(nibName: "PokemonCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "PokemonCollectionViewCell")
    }
    
    func showPokemons() {
        pokemonCollectionView.reloadData()
    }

}

extension PokedexViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        presenter?.pokemons.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PokemonCollectionViewCell", for: indexPath) as? PokemonCollectionViewCell,
              let pokemon = presenter?.pokemons[indexPath.row] else { return UICollectionViewCell() }
        let pokemonNumber = indexPath.row + 1
        cell.pokemonNameLabel.text = pokemon.name
        cell.pokemonImageView.loadImage(from: URL(string: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/\(pokemonNumber).png"))
        return cell
    }
}
