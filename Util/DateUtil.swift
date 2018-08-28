//
//  DateUtil.swift v.0.1.1
//  Swift4Util
//
//  Created by Rudolf Farkas on 18.06.18.
//  Copyright © 2018 Rudolf Farkas. All rights reserved.
//

import Foundation

extension Date {
    private func formatted(fmt: String) -> String {
        let formatter = DateFormatter()
        formatter.timeZone = TimeZone.current // the default is UTC
        formatter.dateFormat = fmt
        return formatter.string(from: self)
    }

    // computed property returns local date string

    /// Returns the local date string
    var ddMMyyyy: String {
        return formatted(fmt: "dd.MM.yyyy")
    }

    /// Returns the local time string
    var HHmmss: String {
        return formatted(fmt: "HH:mm:ss")
    }

    /// Returns the local time string with milliseconds
    var HHmmssSSS: String {
        return formatted(fmt: "HH:mm:ss.SSS")
    }
}
