//
//  TimeIntervalUtil.swift v.0.1.0
//  Swift4Util
//
//  Created by Rudolf Farkas on 22.06.19.
//  Copyright © 2019 Rudolf Farkas. All rights reserved.
//

import Foundation

extension TimeInterval {
    internal static var secondsPerDay: Double { return 24 * 60 * 60 }

    init(days: Double) {
        self = days * TimeInterval.secondsPerDay
    }
}
