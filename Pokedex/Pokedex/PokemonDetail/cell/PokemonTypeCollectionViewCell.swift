//
//  PokemonTypeCollectionViewCell.swift
//  Pokedex
//
//  Created by Michel Torres Alonso on 12/06/22.
//

import UIKit

class PokemonTypeCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var containerView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        initCell()
    }

    func initCell() {
        titleLabel.textColor = .black
        containerView.backgroundColor = .white
        containerView.layer.cornerRadius = 14.0
        containerView.layer.shadowColor = UIColor.black.cgColor
        containerView.layer.shadowRadius = 3 / 2.0
        containerView.layer.shadowOpacity = 0.12
        containerView.layer.shadowOffset = CGSize(width: 0, height: 2)
        containerView.layer.shadowPath = nil
    }
}
