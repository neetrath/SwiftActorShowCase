//
//  RandomSongService.swift
//  ActorShowCase
//
//  Created by Ruttanachai Auitragool on 14/7/22.
//

import Foundation

protocol RandomSongAPIServiceProtocol {
    var cache: APICacheProtocol? { get set }
    var actorCache: APICacheActor? { get set }
    func request(_ api: API, completion: @escaping (Result<[ItunesResult], APIError>) -> Void)
    func requestWithActorCache(_ api: API, completion: @escaping (Result<[ItunesResult], APIError>) -> Void) async
}

class RandomSongAPIService: RandomSongAPIServiceProtocol {
    var cache: APICacheProtocol?
    var actorCache: APICacheActor?

    func request(_ api: API, completion: @escaping (Result<[ItunesResult], APIError>) -> Void) {
        guard let url = URL(string: api.fullURL) else {
            completion(.failure(.unexpected))
            return
        }

        if let data = cache?.read(api: api) {
            // Parse the JSON data from cache
            if let decodedResponse = try? JSONDecoder().decode(ItunesResponse.self, from: data) {
                completion(.success(decodedResponse.results))
            } else {
                completion(.failure(.unexpected))
            }
            return
        }

        let task = URLSession.shared.dataTask(with: url) { [weak self] data, _, _ in
            guard let data = data else {
                completion(.failure(.unexpected))
                return
            }

            // Parse the JSON data
            if let decodedResponse = try? JSONDecoder().decode(ItunesResponse.self, from: data) {
                self?.cache?.write(api: api, data: data)
                completion(.success(decodedResponse.results))
            } else {
                completion(.failure(.unexpected))
            }
        }

        task.resume()
    }

    func requestWithActorCache(_ api: API, completion: @escaping (Result<[ItunesResult], APIError>) -> Void) async {
        guard let url = URL(string: api.fullURL) else {
            completion(.failure(.unexpected))
            return
        }

        if let data = await actorCache?.read(api: api) {
            // Parse the JSON data from cache
            if let decodedResponse = try? JSONDecoder().decode(ItunesResponse.self, from: data) {
                completion(.success(decodedResponse.results))
            } else {
                completion(.failure(.unexpected))
            }
        } else {
            do {
                // Use the async variant of URLSession to fetch data
                let (data, _) = try await URLSession.shared.data(from: url)

                // Parse the JSON data
                if let decodedResponse = try? JSONDecoder().decode(ItunesResponse.self, from: data) {
                    await actorCache?.write(api: api, data: data)
                    completion(.success(decodedResponse.results))
                } else {
                    completion(.failure(.unexpected))
                }
            } catch {
                completion(.failure(.unexpected))
            }
        }
    }
}
