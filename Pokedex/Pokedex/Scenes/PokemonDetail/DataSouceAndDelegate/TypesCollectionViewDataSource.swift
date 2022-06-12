//
//  TypesCollectionViewDataSource.swift
//  Pokedex
//
//  Created by Michel Torres Alonso on 12/06/22.
//

import UIKit

final class TypesCollectionViewDataSource: NSObject, UICollectionViewDataSource {
    var types = [PokemonTypes]()
    
    init(types: [PokemonTypes]) {
        self.types = types
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PokemonTypeCollectionViewCell", for: indexPath) as! PokemonTypeCollectionViewCell
        cell.titleLabel.text = types[indexPath.row].type?.name
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return types.count
    }
}
