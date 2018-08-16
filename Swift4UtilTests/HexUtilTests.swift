//
//  HexUtilTests.swift v.0.1.0
//  Swift4UtilTests
//
//  Created by Rudolf Farkas on 15.08.18.
//  Copyright © 2018 Rudolf Farkas. All rights reserved.
//

import XCTest

class HexUtilTests: XCTestCase {
    override func setUp() {
        super.setUp()
    }

    override func tearDown() {
        super.tearDown()
    }

    func testHexDump() {
        let string = "Hello Swift\t\n\n"
        let hexdump = string.hexDump
        XCTAssertEqual(hexdump, "48 65 6c 6c 6f 20 53 77 69 66 74 09 0a 0a")

        print(string, string.hexDump)

        let s = 4
        for i in stride(from: 0, to: string.count, by: s) {
            let sub = string.dropFirst(i).prefix(s) as Substring
            print(sub)
        }
        string.hexdump(step: 5)
    }

    func testHexDump2() {
        
        //https://oleb.net/blog/2017/11/swift-4-strings/
        let flags = "🇧🇷🇳🇿"
        //flags.count // → 2
        //To inspect the Unicode scalars a string is composed of, use the unicodeScalars view. Here, we format the scalar values as hex numbers in the common format for code points:
        
        let flagsArr = flags.unicodeScalars.map {
            "U+\(String($0.value, radix: 16, uppercase: true))"
        }
        print("--- testHexDump2 flagsArr=", flagsArr)
        // → ["U+1F1E7", "U+1F1F7", "U+1F1F3", "U+1F1FF9"]
        print("--- testHexDump2 hexDump=", flags.hexDump)
        // 1f1e7 1f1f7 1f1f3 1f1ff

    }
}
