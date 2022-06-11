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

    var totalPage = 1
    var currentPage = 0
    
	override func viewDidLoad() {
        super.viewDidLoad()
        title = "Pokedex"
        setupCollectionView()
        setCollectionLayout(pokemonCollectionView)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        presenter?.getPokemons()
    }
    
    func setupCollectionView() {
        pokemonCollectionView.dataSource = self
        pokemonCollectionView.delegate = self
        pokemonCollectionView.register(UINib(nibName: "PokemonCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "PokemonCollectionViewCell")
        pokemonCollectionView.contentInset = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
    }
    
    public func setCollectionLayout(_ collectionView: UICollectionView) {
        let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout ?? UICollectionViewFlowLayout()
        let width = UIScreen.main.bounds.width/2 - 16
        layout.itemSize = CGSize(width: width , height: width)
        collectionView.reloadData()
    }
    
    func showPokemons() {
        pokemonCollectionView.reloadData()
        let pokemonCount = presenter?.pokemons.count ?? 0
        totalPage = pokemonCount / 20
    }

}

extension PokedexViewController: UICollectionViewDataSource, UICollectionViewDelegate {
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
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        guard let pokemonCount = presenter?.pokemons.count else { return }
        if indexPath.row == (pokemonCount - 1) && currentPage < totalPage {
            currentPage += 1
            presenter?.getPokemons()
        }
    }
}
