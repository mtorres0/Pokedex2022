//
//  TypesCollectionViewDelegate.swift
//  Pokedex
//
//  Created by Michel Torres Alonso on 12/06/22.
//

import UIKit

class TypesCollectionViewDelegate: NSObject, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    weak var delegate: TypeDelegate?
    let types: [PokemonTypes]
    
    var lastIndexActive: IndexPath? = nil
    
    init(delegate: TypeDelegate, types: [PokemonTypes]) {
        self.delegate = delegate
        self.types = types
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let pokemonType = types[indexPath.row].type else { return }
        delegate?.selectPokemonType(pokemonType)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let itemSpacing = 20
        let labelWidth = (types[indexPath.row].type?.name?.count ?? 0) * 12
        let cellWidth = labelWidth + itemSpacing
        return CGSize(width: cellWidth, height: 36)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets.init(top: 0, left: 8, bottom: 0, right: 8)
    }

}
