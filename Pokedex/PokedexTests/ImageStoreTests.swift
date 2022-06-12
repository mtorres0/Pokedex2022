//
//  ImageStoreTests.swift
//  PokedexTests
//
//  Created by Michel Torres Alonso on 17/12/21.
//

import XCTest
@testable import Pokedex

class ImageStoreTests: XCTestCase {

    func testSaveImageCache() {
        ImageStore.save(UIImage(), forKey: "demo")
        
        let image = ImageStore.image(forKey: "demo")
        
        XCTAssertNotNil(image)
    }
    
    func testDeleteImageCache() {
        ImageStore.save(UIImage(), forKey: "demo")
        ImageStore.deleteImage(forKey: "demo")
        
        let image = ImageStore.image(forKey: "demo")
        XCTAssertNil(image)
    }

}
