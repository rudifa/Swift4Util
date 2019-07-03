//
//  StringUtilTests.swift v.0.2.1
//  Swift4UtilTests
//
//  Created by Rudolf Farkas on 22.07.18.
//  Copyright © 2018 Rudolf Farkas. All rights reserved.
//

import XCTest

class StringUtilTests: XCTestCase {
    override func setUp() {
        super.setUp()
    }

    override func tearDown() {
        super.tearDown()
    }

    func testStringSplitAndJoined() {
        let str = "abcd"

        let arrstr1 = str.split()
        XCTAssertEqual(arrstr1, ["a", "b", "c", "d"])

        let strj = arrstr1.joined()
        XCTAssertEqual(strj, "abcd")
    }

    func testStringSplitOnCharacterAndJoined() {
        let str1 = "abc def   ghi"
        // use the builtin String.split() method with defaults
        let arrstr1 = str1.split(separator: " ")
        XCTAssertEqual(arrstr1, ["abc", "def", "ghi"])

        let str2 = "his obsessions"
        // use the builtin String.split() method with defaults
        let arrstr2 = str2.split(separator: "s")
        XCTAssertEqual(arrstr2, ["hi", " ob", "e", "ion"])

        let str3 = "  1 + 1    cos =  "
        // use the builtin String.split() method with defaults
        let arrstr3 = str3.split(separator: " ")
        XCTAssertEqual(arrstr3, ["1", "+", "1", "cos", "="])
    }

    func test_camelCaseSplit() {
        XCTAssertEqual("HelloThere".camelCaseSplit, "Hello There")
        XCTAssertEqual("".camelCaseSplit, "")
        XCTAssertEqual("A".camelCaseSplit, "A")
        XCTAssertEqual("ABRACADABRA".camelCaseSplit, "A B R A C A D A B R A")
        XCTAssertEqual("IoT".camelCaseSplit, "Io T")
        XCTAssertEqual("camelCaseSplit".camelCaseSplit, "Camel Case Split")
    }
}
