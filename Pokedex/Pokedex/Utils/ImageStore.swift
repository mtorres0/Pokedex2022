//
//  ImageStore.swift
//  TheMovieDb
//
//  Created by Michel Torres Alonso on 14/12/21.
//

import UIKit

final class ImageStore {
    
    private static let cache = NSCache<NSString, UIImage>()
    
    private static func imageURL(forKey key: String) -> URL {
        let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        return documentDirectory.appendingPathComponent(key)
    }
    
    static func save(_ image: UIImage, forKey key: String) {
        cache.setObject(image, forKey: key as NSString)
        let url = imageURL(forKey: key)
        if let data = UIImage().jpegData(compressionQuality: 0.5) {
            _ = try? data.write(to: url, options: [.atomic])
        }
    }
    
    static func image(forKey key: String) -> UIImage? {
        if let existingImage = cache.object(forKey: key as NSString) {
            return existingImage
        }
        
        let url = imageURL(forKey: key)
        guard let imageFromDisk = UIImage(contentsOfFile: url.path) else {
            return nil
        }
        
        cache.setObject(imageFromDisk, forKey: key as NSString)
        return imageFromDisk
    }
    
    static func deleteImage(forKey key: String) {
        cache.removeObject(forKey: key as NSString)
        
        let url = imageURL(forKey: key)
        do {
            try FileManager.default.removeItem(at: url)
        } catch let error {
            print("Error removing the image from disk: \(error)")
        }
    }
    
    static func deleteAll() {
        cache.removeAllObjects()
    }
}
