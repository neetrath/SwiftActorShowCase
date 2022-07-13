//
//  ServerUTCDateFormatter.swift
//  MajorCineplex
//
//  Created by Andrei Solovev on 8/4/21.
//

import Foundation
 
extension DateFormatter {
    static var serverUTC: DateFormatter {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"
        dateFormatter.calendar = Calendar(identifier: .gregorian)
        dateFormatter.timeZone = TimeZone(abbreviation: "UTC")
        dateFormatter.locale = Localization.en.locale
        return dateFormatter
    }

    static var serverUTC2: DateFormatter {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss'Z'"
        dateFormatter.calendar = Calendar(identifier: .gregorian)
        dateFormatter.timeZone = TimeZone(abbreviation: "UTC")
        dateFormatter.locale = Localization.en.locale
        return dateFormatter
    }

    static var serverUTCShort: DateFormatter {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        dateFormatter.calendar = Calendar(identifier: .gregorian)
        dateFormatter.timeZone = TimeZone.current
        dateFormatter.locale = Localization.en.locale
        return dateFormatter
    }

    static var ticketOpenUTCShort: DateFormatter {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MMM-yyyy HH:mm"
        dateFormatter.calendar = Calendar(identifier: .gregorian)
        dateFormatter.timeZone = TimeZone.current
        dateFormatter.locale = Localization.en.locale
        return dateFormatter
    }

    static var transactionUTC: DateFormatter {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy HH:mm:ss"
        dateFormatter.calendar = Calendar(identifier: .gregorian)
        dateFormatter.timeZone = TimeZone.current
        dateFormatter.locale = Localization.en.locale
        return dateFormatter
    }

    static var serverUTCDOB: DateFormatter {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd MMM yyyy"
        dateFormatter.calendar = Calendar(identifier: .gregorian)
        dateFormatter.timeZone = TimeZone.current
        dateFormatter.locale = Localization.en.locale
        return dateFormatter
    }
    
    static var showTimeFormatter: DateFormatter {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm"
        dateFormatter.timeZone = TimeZone.current
        dateFormatter.calendar = Calendar(identifier: .gregorian)
        dateFormatter.locale = Localization.en.locale
        return dateFormatter
    }
    
    static var analyticDateFormatter: DateFormatter {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyyMMdd"
        dateFormatter.timeZone = TimeZone.current
        dateFormatter.calendar = Calendar(identifier: .gregorian)
        dateFormatter.locale = Localization.en.locale
        return dateFormatter
    }
}
