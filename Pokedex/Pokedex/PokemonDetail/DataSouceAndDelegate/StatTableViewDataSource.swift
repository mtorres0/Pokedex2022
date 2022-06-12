//
//  StatTableViewDataSource.swift
//  Pokedex
//
//  Created by Michel Torres Alonso on 12/06/22.
//

import UIKit

class StatTableViewDataSource: NSObject, UITableViewDataSource  {
    let stats: [PokemonStats]
    
    init(stats: [PokemonStats]) {
        self.stats = stats
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return stats.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "StatTableViewCell", for: indexPath) as? StatTableViewCell else { return UITableViewCell() }
        cell.statNameLabel.text = stats[indexPath.row].stat?.name
        let statValue = stats[indexPath.row].baseStat ?? 0
        cell.statValueLabel.text = "\(statValue)"
        let statPercentage = Float(statValue) / 200.0
        cell.statProgressView.progress = Float(statPercentage)
        return cell
    }
}
