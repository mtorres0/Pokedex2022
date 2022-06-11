//
//  UIImageViewExtension.swift
//  TheMovieDb
//
//  Created by Michel Torres Alonso on 14/12/21.
//

import Foundation
import UIKit

extension UIImageView {
    
    /// Load an image from url
    /// - Parameter url: the image url
    func loadImage(from url: URL?) {
        guard let url = url else { return }
        if let image = ImageStore.image(forKey: url.absoluteString) {
            self.image = image
        } else {
            loadFromNetwork(url)
        }
    }
    
    private func loadFromNetwork(_ url: URL) {
        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            DispatchQueue.main.async {
                guard let data = data else { print(error?.localizedDescription ?? "Fetch image Error"); return }
                if let downloadedImage = UIImage(data: data) {
                    self.image = downloadedImage
                    ImageStore.save(downloadedImage, forKey: url.absoluteString)
                }
            }
        }
        task.resume()
    }
}
