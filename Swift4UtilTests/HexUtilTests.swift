//
//  HexUtilTests.swift
//  Swift4UtilTests
//
//  Created by Rudolf Farkas on 15.08.18.
//  Copyright © 2018 Rudolf Farkas. All rights reserved.
//

import XCTest

class HexUtilTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testHexDump() {
        let string = "Hello Swift!"
        let hexdump = string.hexDump
        XCTAssertEqual(hexdump, "48 65 6C 6C 6F 20 53 77 69 66 74 21")

        let s = 4
        for i in stride(from: 0, to: string.count, by: s) {
            let sub = string.dropFirst(i).prefix(s) as Substring
            print(sub)
        }
        string.hexdump(step: 5)
    }
    

}
