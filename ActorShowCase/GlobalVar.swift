//
//  GlobalVar.swift
//  ActorShowCase
//
//  Created by Ruttanachai Auitragool on 20/1/22.
//

import Foundation

class GlobalVar {
    static let shared = GlobalVar()

    var cache = APICache()
    var cacheThreadSafe = APICacheThreadSafe()
    var actorCache = APICacheActor()
    
    init() {
    }
}
