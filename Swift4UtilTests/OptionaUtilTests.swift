//
//  OptionaUtilTests.swift
//  Swift4UtilTests
//
//  Created by Rudolf Farkas on 15.10.18.
//  Copyright © 2018 Rudolf Farkas. All rights reserved.
//

import XCTest

class OptionaUtilTests: XCTestCase {
    override func setUp() {}

    override func tearDown() {}

    func testOptionalIntIncrement() {

        var ival: Int?
        ival.increment()
        XCTAssertEqual(ival, 1)

        struct Stats {
            var count: Int?
        }

        var stats = Stats()
        stats.count.increment()
        XCTAssertEqual(stats.count, 1)
        stats.count.increment(by: -1)
        XCTAssertEqual(stats.count, 0)
    }
}
