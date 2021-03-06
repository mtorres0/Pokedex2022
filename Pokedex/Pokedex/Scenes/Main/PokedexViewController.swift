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

final class PokedexViewController: UIViewController, PokedexViewProtocol {

    @IBOutlet weak var pokemonCollectionView: UICollectionView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    var presenter: PokedexPresenterProtocol?
    
    var pokemonType: PokemonType? = nil
    var isTypeFilterOn: Bool = false
    
    var pokedexDataSource: PokedexCollectionViewDataSource?

    var totalPage = 1
    var currentPage = 0
    var isSearchModeOn = false
    
	override func viewDidLoad() {
        super.viewDidLoad()
        title = "Pokédex"
        setupCollectionView()
        setCollectionLayout(pokemonCollectionView)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupSearchBar()
        getPokemons()
    }
    
    private func getPokemons() {
        if let type = pokemonType {
            title = type.name?.capitalized
            isTypeFilterOn = true
            presenter?.getPokemonByType(url: type.url ?? "")
        } else {
            presenter?.getPokemons()
        }
    }
    
    private func setupSearchBar() {
        searchBar.delegate = self
        searchBar.text = ""
        searchBar.tintColor = .blue
    }
    
    private func setupCollectionView() {
        pokedexDataSource = PokedexCollectionViewDataSource(pokemons: presenter?.pokemonsFiltered ?? [])
        pokemonCollectionView.dataSource = pokedexDataSource
        pokemonCollectionView.delegate = self
        pokemonCollectionView.register(UINib(nibName: "PokemonCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "PokemonCollectionViewCell")
        pokemonCollectionView.contentInset = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
    }
    
    public func setCollectionLayout(_ collectionView: UICollectionView) {
        let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout ?? UICollectionViewFlowLayout()
        let width = UIScreen.main.bounds.width/2 - 16
        layout.itemSize = CGSize(width: width , height: width)
    }
    
    func showPokemons() {
        pokedexDataSource = PokedexCollectionViewDataSource(pokemons: presenter?.pokemonsFiltered ?? [])
        pokemonCollectionView.dataSource = pokedexDataSource
        pokemonCollectionView.reloadData()
        let pokemonCount = presenter?.pokemons.count ?? 0
        totalPage = pokemonCount / 20
    }

    func showErrorMessage() {
        let alert = UIAlertController(title: "Error", message: "No se pudieron obtener los datos.", preferredStyle: .alert)
        let okButton = UIAlertAction(title: "Aceptar", style: .cancel) { action in
            alert.dismiss(animated: true, completion: nil)
        }
        let retryButton = UIAlertAction(title: "Reintentar", style: .default) { action in
            self.getPokemons()
            alert.dismiss(animated: true, completion: nil)
        }
        alert.addAction(okButton)
        alert.addAction(retryButton)
        self.present(alert, animated: true, completion: nil)
    }
}

extension PokedexViewController: UICollectionViewDelegate {

    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        guard let pokemonCount = presenter?.pokemonsFiltered.count, !isTypeFilterOn else { return }
        if indexPath.row == (pokemonCount - 1) && currentPage < totalPage, !isSearchModeOn {
            currentPage += 1
            presenter?.getPokemons()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        presenter?.goToPokemonDetail(index: indexPath.row)
    }
}

extension PokedexViewController: UISearchBarDelegate {
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        searchBar.showsCancelButton = false
    }
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        searchBar.showsCancelButton = false
        self.isSearchModeOn = false
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.endEditing(true)
        self.isSearchModeOn = false
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        self.isSearchModeOn = searchText.count == 0 ? false: true
        presenter?.searchPokemon(text: searchText)
    }
}
