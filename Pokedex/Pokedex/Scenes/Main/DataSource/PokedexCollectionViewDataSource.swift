//
//  PokedexCollectionViewDataSource.swift
//  Pokedex
//
//  Created by Michel Torres Alonso on 12/06/22.
//

import UIKit

final class PokedexCollectionViewDataSource: NSObject, UICollectionViewDataSource {
    var pokemons = [Pokemon]()
    
    init(pokemons: [Pokemon]) {
        self.pokemons = pokemons
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        pokemons.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PokemonCollectionViewCell", for: indexPath) as? PokemonCollectionViewCell else { return UICollectionViewCell() }
        let pokemon = pokemons[indexPath.row]
        let pokemonNumber = Int(pokemon.url.split(separator: "/").last ?? "0") ?? 0
        cell.pokemonNameLabel.text = pokemon.name.capitalized
        cell.pokemonImageView.loadImage(from: URL(string: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/\(pokemonNumber).png"))
        return cell
    }
}
