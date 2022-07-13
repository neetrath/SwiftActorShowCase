//
//  Localization.swift
//  MajorCineplex
//
//  Created by Andrei Solovev on 11/2/21.
//

import Foundation

enum Localization: String, CaseIterable, Codable, Equatable {
    case th
    case en

    var locale: Locale {
        switch self {
        case .th: return Locale(identifier: "th_TH")
        case .en: return Locale(identifier: "en_TH")
        }
    }
}
