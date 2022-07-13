//
//  RandomSongModel.swift
//  ActorShowCase
//
//  Created by Ruttanachai Auitragool on 14/7/22.
//

import Foundation

struct ItunesResponse: Codable {
    var results: [ItunesResult]
}

struct ItunesResult: Codable {
    var trackId: Int
    var trackName: String
    var collectionName: String
}
