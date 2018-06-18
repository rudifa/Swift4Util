//
//  Swift4UtilTests.swift
//  Swift4UtilTests
//
//  Created by Rudolf Farkas on 18.06.18.
//  Copyright © 2018 Rudolf Farkas. All rights reserved.
//

import XCTest
@testable import Swift4Util

class Swift4UtilTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testDateExtensions() {

        let date = Date()
        print("--- date=", date, "ddMMyyy=", date.ddMMyyyy)
        print("--- time=", date, "HHmmss=", date.HHmmss)

    }
    
}


/*
func testDateExt() {
    let date = Date()
    print("--- date=", date, "property ddMMyyy", date.ddMMyyyy)
}

func testDateExt2() {
    let date = Date()
    print("--- date=", date, "property ddmmyyy", date.ddmmyyyy)
    print("--- date=", date, "property hhmmss", date.hhmmss)

    print("--- timezone=", TimeZone.current)
}
*/
