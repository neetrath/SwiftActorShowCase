//
//  Date+Extensions.swift
//  TrueDroneFarmer
//
//  Created by Ruttanachai Auitragool on 18/8/21.
//

import Foundation

extension Date {
    static func - (recent: Date, previous: Date) -> (month: Int?, day: Int?, hour: Int?, minute: Int?, second: Int?) {
        let day = Calendar.current.dateComponents([.day], from: previous, to: recent).day
        let month = Calendar.current.dateComponents([.month], from: previous, to: recent).month
        let hour = Calendar.current.dateComponents([.hour], from: previous, to: recent).hour
        let minute = Calendar.current.dateComponents([.minute], from: previous, to: recent).minute
        let second = Calendar.current.dateComponents([.second], from: previous, to: recent).second

        return (month: month, day: day, hour: hour, minute: minute, second: second)
    }

    func relativeYears(fromDate: Date) -> Int {
        let startDate = fromDate.setTime(hour: 0, min: 0, sec: 0)
        let endDate = Date().setTime(hour: 0, min: 0, sec: 0)
        let diffComponents = Calendar.current.dateComponents([.year], from: startDate, to: endDate)
        let years = diffComponents.year ?? Int.max
        return years
    }

    func setTime(hour: Int, min: Int, sec: Int) -> Date {
        let x: Set<Calendar.Component> = [.year, .month, .day, .hour, .minute, .second]
        let cal = Calendar.current
        var components = cal.dateComponents(x, from: self)

        components.hour = hour
        components.minute = min
        components.second = sec

        return cal.date(from: components)!
    }

    func isGreaterThanDate(dateToCompare: Date) -> Bool {
        // Declare Variables
        var isGreater = false
        // Compare Values
        if compare(dateToCompare) == ComparisonResult.orderedDescending {
            isGreater = true
        }
        // Return Result
        return isGreater
    }

    func isLessThanDate(dateToCompare: Date) -> Bool {
        // Declare Variables
        var isLess = false
        // Compare Values
        if compare(dateToCompare) == ComparisonResult.orderedAscending {
            isLess = true
        }
        // Return Result
        return isLess
    }

    func equalToDate(dateToCompare: Date) -> Bool {
        // Declare Variables
        var isEqualTo = false
        // Compare Values
        if compare(dateToCompare) == ComparisonResult.orderedSame {
            isEqualTo = true
        }
        return isEqualTo
    }

    func addDays(daysToAdd: Int) -> Date {
        let secondsInDays: TimeInterval = Double(daysToAdd) * 60 * 60 * 24
        let dateWithDaysAdded: Date = addingTimeInterval(secondsInDays)
        return dateWithDaysAdded
    }

    func addHours(hoursToAdd: Int) -> Date {
        let secondsInHours: TimeInterval = Double(hoursToAdd) * 60 * 60
        let dateWithHoursAdded: Date = addingTimeInterval(secondsInHours)
        return dateWithHoursAdded
    }

    func addMinutes(minutesToAdd: Int) -> Date {
        let secondsInHours: TimeInterval = Double(minutesToAdd) * 60
        let dateWithMinutesAdded: Date = addingTimeInterval(secondsInHours)
        return dateWithMinutesAdded
    }

    func addSeconds(secondsToAdd: Int) -> Date {
        let secondsInHours: TimeInterval = Double(secondsToAdd)
        let dateWithSecondsAdded: Date = addingTimeInterval(secondsInHours)
        return dateWithSecondsAdded
    }
}
