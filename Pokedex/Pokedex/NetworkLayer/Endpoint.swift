//
//  Endpoint.swift
//  TheMovieDb
//
//  Created by Michel Torres Alonso on 19/11/21.
//

import Foundation

protocol Endpoint {
    var base: String { get }
    var path: String { get }
    var urlComponents: URLComponents { get }
    var request: URLRequest { get }
}
