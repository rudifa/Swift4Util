//
//  DateUtilTests.swift
//  Swift4UtilTests v.0.1.3
//
//  Created by Rudolf Farkas on 18.06.18.
//  Copyright © 2018 Rudolf Farkas. All rights reserved.
//

import XCTest

class DateUtilTests: XCTestCase {
    override func setUp() {
        super.setUp()
    }

    override func tearDown() {
        super.tearDown()
    }

    func testDateExtensions() {
        let date = Date()
        print("--- date=", date, "ddMMyyy=", date.ddMMyyyy)
        print("--- time=", date, "HHmmss=", date.HHmmss)
        print("--- Today", date.ddMMyyyy, "at", date.HHmmss, "...")

        let date0 = Date(timeIntervalSince1970: -1_006_347_601)
        XCTAssertEqual("10.02.1938", date0.ddMMyyyy)
        XCTAssertEqual("11:59:59", date0.HHmmss)
        XCTAssertEqual("11:59:59.000", date0.HHmmssSSS)
        print("--- Once upon a time", date0.ddMMyyyy, "at", date0.HHmmss, "...")
    }

    func testInit() {
        let date = Date(seconds: 0)
        XCTAssertEqual(date, Date(timeIntervalSinceReferenceDate: 0))
        XCTAssertEqual(date.ddMMyyyy, "01.01.2001")
    }

    func testTimeStampAndTag() {
        let date = Date(seconds: 0)
        XCTAssertEqual(date.timeStamp, 978_307_200.0)
        XCTAssertEqual(date.timeTag, "978307200_00000")
    }
}
