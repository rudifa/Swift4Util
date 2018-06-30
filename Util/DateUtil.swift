//
//  DateUtil.swift v.0.1.0
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
    var ddMMyyyy: String {
        get {
            return formatted(fmt: "dd.MM.yyyy")
        }
    }

    // computed property returns local time string
    var HHmmss: String {
        get {
            return formatted(fmt: "HH:mm:ss")
        }
    }
    
}
