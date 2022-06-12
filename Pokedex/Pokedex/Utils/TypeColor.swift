//
//  TypeColor.swift
//  Pokedex
//
//  Created by Michel Torres Alonso on 12/06/22.
//

import Foundation
import UIKit

enum TypeColor: String {
    case normal
    case fire
    case water
    case electric
    case grass
    case ice
    case fighting
    case poison
    case ground
    case flying
    case psychic
    case bug
    case rock
    case ghost
    case dragon
    case dark
    case steel
    case fairy
    
    var color: UIColor {
        switch self {
        case .normal:
            return UIColor(hexString: "#A8A77A")
        case .fire:
            return UIColor(hexString: "#EE8130")
        case .water:
            return UIColor(hexString: "#6390F0")
        case .electric:
            return UIColor(hexString: "#F7D02C")
        case .grass:
            return UIColor(hexString: "#7AC74C")
        case .ice:
            return UIColor(hexString: "#96D9D6")
        case .fighting:
            return UIColor(hexString: "#C22E28")
        case .poison:
            return UIColor(hexString: "#A33EA1")
        case .ground:
            return UIColor(hexString: "#E2BF65")
        case .flying:
            return UIColor(hexString: "#A98FF3")
        case .psychic:
            return UIColor(hexString: "#F95587")
        case .bug:
            return UIColor(hexString: "#A6B91A")
        case .rock:
            return UIColor(hexString: "#B6A136")
        case .ghost:
            return UIColor(hexString: "#735797")
        case .dragon:
            return UIColor(hexString: "#6F35FC")
        case .dark:
            return UIColor(hexString: "#705746")
        case .steel:
            return UIColor(hexString: "#B7B7CE")
        case .fairy:
            return UIColor(hexString: "#D685AD")
        }
    }
}
