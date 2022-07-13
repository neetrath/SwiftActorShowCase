//
//  API.swift
//  ActorShowCase
//
//  Created by Ruttanachai Auitragool on 14/7/22.
//

import Foundation

struct API {
    private let baseURL = "https://itunes.apple.com"

    var endpoint: String = ""

    var fullURL: String {
        return baseURL + endpoint
    }

    var hash: String {
        return fullURL.sha256()
    }
}
