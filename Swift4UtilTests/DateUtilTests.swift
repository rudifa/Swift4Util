//
//  DateUtilTests.swift
//  Swift4UtilTests
//
//  Created by Rudolf Farkas on 18.06.18.
//  Copyright © 2018 Rudolf Farkas. All rights reserved.
//

import XCTest
@testable import Swift4Util

class DateUtilTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testDateExtensions() {

        let date = Date()
        print("--- date=", date, "ddMMyyy=", date.ddMMyyyy)
        print("--- time=", date, "HHmmss=", date.HHmmss)
        print("--- Today", date.ddMMyyyy, "at", date.HHmmss, "...")

        let date0 = Date(timeIntervalSince1970: -1006347601)
        XCTAssertEqual("10.02.1938", date0.ddMMyyyy)
        XCTAssertEqual("11:59:59", date0.HHmmss)
        print("--- Once upon a time", date0.ddMMyyyy, "at", date0.HHmmss, "...")

    }
    
}


