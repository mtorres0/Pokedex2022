//
//  StatTableViewCell.swift
//  Pokedex
//
//  Created by Michel Torres Alonso on 12/06/22.
//

import UIKit

class StatTableViewCell: UITableViewCell {

    @IBOutlet weak var statNameLabel: UILabel!
    @IBOutlet weak var statValueLabel: UILabel!
    @IBOutlet weak var statProgressView: UIProgressView!
    override func awakeFromNib() {
        super.awakeFromNib()
        statProgressView.tintColor = .blue
    }
}
