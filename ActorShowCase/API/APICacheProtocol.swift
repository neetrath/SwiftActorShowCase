//
//  APICacheProtocol.swift
//  ActorShowCase
//
//  Created by Ruttanachai Auitragool on 14/7/22.
//

import Foundation

protocol APICacheProtocol {
    func read(api: API) -> Data?
    func write(api: API, data: Data)
    func clear(api: API)
}
