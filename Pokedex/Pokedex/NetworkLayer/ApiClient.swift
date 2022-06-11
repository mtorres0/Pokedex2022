//
//  ApiClient.swift
//  TheMovieDb
//
//  Created by Michel Torres Alonso on 21/11/21.
//

import Foundation

typealias APICLientResult<T> = (Result<T, APIError>) -> Void

protocol APIClient: AnyObject {
    var session: URLSession { get }
    func fetch<T>(with request: URLRequest, completion: @escaping APICLientResult<T>) -> URLSessionDataTask where T: Decodable
}

extension APIClient {
    @discardableResult
    func fetch<T>(with request: URLRequest, completion: @escaping APICLientResult<T>) -> URLSessionDataTask where T: Decodable {
        let task = session.dataTask(with: request) { data, _, _ in
            guard let data = data else {
                DispatchQueue.main.async {
                    completion(Result.failure(.requestFailed))
                }
                return
            }
            
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            
            do {
                let result = try decoder.decode(T.self, from: data)
                DispatchQueue.main.async {
                    completion(Result.success(result))
                }
            } catch {
                DispatchQueue.main.async {
                    completion(Result.failure(.jsonParsingFailure))
                }
            }
        }

        task.resume()
        return task
    }
}
