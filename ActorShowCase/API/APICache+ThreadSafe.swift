//
//  APICache+ThreadSafe.swift
//  ActorShowCase
//
//  Created by Ruttanachai Auitragool on 14/7/22.
//

import Foundation

class APICacheThreadSafe: APICacheProtocol {
    struct Item {
        let api: API
        let data: Data
        let timeout: TimeInterval
    }

    struct Formatters {
        static let date = "EEE, dd MMM yyyy HH:mm:ss z"
        static let expires = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"

        static func date(_ string: String) -> Date? {
            let formatter = DateFormatter.serverUTC
            formatter.dateFormat = Self.date
            return formatter.date(from: string)
        }

        static func expires(_ string: String) -> Date? {
            let formatter = DateFormatter.serverUTC
            formatter.dateFormat = Self.expires
            return formatter.date(from: string)
        }
    }

    private var items = ThreadSafeDictionary<String, Item>()

    func read(api: API) -> Data? {
        guard let item = items[api.hash] else { return nil }
        guard item.timeout.afterNow else {
            items.removeValue(forKey: api.hash)
            return nil
        }
        return item.data
    }

    func write(api: API, data: Data) {
        let timeout = Date().addSeconds(secondsToAdd: 30).timeIntervalSince1970
        let item = Item(api: api, data: data, timeout: timeout)
        items[api.hash] = item
    }

    func clear(api: API) {
        items.removeValue(forKey: api.hash)
    }
}
