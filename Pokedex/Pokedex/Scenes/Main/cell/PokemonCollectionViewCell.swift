//
//  PokemonCollectionViewCell.swift
//  Pokedex
//
//  Created by Michel Torres Alonso on 11/06/22.
//

import UIKit

class PokemonCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var pokemonNameLabel: UILabel!
    @IBOutlet weak var pokemonImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        pokemonNameLabel.text = ""
        pokemonImageView.image = nil
    }
}
