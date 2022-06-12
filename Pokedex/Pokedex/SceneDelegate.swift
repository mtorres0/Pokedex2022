//
//  SceneDelegate.swift
//  Pokedex
//
//  Created by Michel Torres Alonso on 11/06/22.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: windowScene)
        window.rootViewController = UINavigationController(rootViewController: PokedexRouter.createModule())
        self.window = window
        window.makeKeyAndVisible()
        window.tintColor = .black
    }
}

