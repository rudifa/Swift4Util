//
//  TimeIntervalUtilTests.swift v.0.1.0
//  Swift4UtilTests
//
//  Created by Rudolf Farkas on 22.06.19.
//  Copyright © 2019 Rudolf Farkas. All rights reserved.
//

import XCTest

class TimeIntervalUtilTests: XCTestCase {
    override func setUp() {}

    override func tearDown() {}

    func testDays() {
        let time1d = TimeInterval(days: 1)
        XCTAssertEqual(time1d, 86400.0)
        let time10d = TimeInterval(days: 10)
        XCTAssertEqual(time10d, 864000.0)
    }
}
