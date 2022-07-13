//
//  TimeInterval+Extensions.swift
//  ActorShowCase
//
//  Created by Ruttanachai Auitragool on 14/7/22.
//

import Foundation

extension TimeInterval {
    var beforeNow: Bool {
        return self < Date().timeIntervalSince1970
    }

    var afterNow: Bool {
        return self > Date().timeIntervalSince1970
    }
}
