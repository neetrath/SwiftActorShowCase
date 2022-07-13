//
//  RandomSongViewModel.swift
//  ActorShowCase
//
//  Created by Ruttanachai Auitragool on 14/7/22.
//

import Foundation

enum Origin {
    case first, second
}

class RandomSongViewModel {
    private let apiService: RandomSongAPIServiceProtocol

    init(apiService: RandomSongAPIServiceProtocol = RandomSongAPIService()) {
        self.apiService = apiService
    }

    var onLoadData: ((Origin, [ItunesResult]) -> Void)?
    var onError: ((APIError) -> Void)?

    func loadData(origin: Origin, artistName: String) {
        guard let artistNameEncoded = artistName.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) else {
            onError?(.unexpected)
            return
        }
        let endpoint = "/search?term=\(artistNameEncoded)&entity=song"

        let api = API(endpoint: endpoint)

        apiService.request(api) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case let .success(iTunesResult):
                self.onLoadData?(origin, iTunesResult)
            case let .failure(error):
                self.onError?(error)
            }
        }
    }

    func loadDataWithActorCache(origin: Origin, artistName: String) {
        guard let artistNameEncoded = artistName.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) else {
            onError?(.unexpected)
            return
        }
        let endpoint = "/search?term=\(artistNameEncoded)&entity=song"

        let api = API(endpoint: endpoint)

        Task.init {
            await apiService.requestWithActorCache(api) { [weak self] result in
                guard let self = self else { return }
                switch result {
                case let .success(iTunesResult):
                    self.onLoadData?(origin, iTunesResult)
                case let .failure(error):
                    self.onError?(error)
                }
            }
        }
    }
}
