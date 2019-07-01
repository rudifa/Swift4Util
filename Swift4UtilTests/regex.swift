//
//  regex.swift
//  Swift4UtilTests
//
//  Created by Rudolf Farkas on 22.12.18.
//  Copyright © 2018 Rudolf Farkas. All rights reserved.
//

import XCTest

func localizedStrings(inStringFile: String) -> [String] {
    var localizedStrings = [String]()
    // var localizedStrings2 = [String]()
    let namePattern = "([\\w-]+)" // capturing parentheses
    let patterns = [
        "#imageLiteral\\(resourceName: \"\(namePattern)\"\\)", // Image Literal
        "UIImage\\(named:\\s*\"\(namePattern)\"\\)", // Default UIImage call (Swift)
        "UIImage imageNamed:\\s*\\@\"\(namePattern)\"", // Default UIImage call
        "Setting\\(name:.*imageName:\\s*\"\(namePattern)\"\\)", // Setting init like: Setting(name: "Terms & Conditions", imageName: "legal_a")
        "\\<image name=\"\(namePattern)\".*", // Storyboard resources
        "R.image.\(namePattern)\\(\\)", // R.swift support
    ]
    for p in patterns {
        let regex = try? NSRegularExpression(pattern: p, options: [])
        let range = NSRange(location: 0, length: (inStringFile as NSString).length)
        regex?.enumerateMatches(in: inStringFile, options: [], range: range) { result, _, _ in
            if let r = result {
                let value = (inStringFile as NSString).substring(with: r.range(at: 1))
                localizedStrings.append(value)
            }
        }
    }
//    for p in patterns {
//        let m = inStringFile.matches(for: p)
//        localizedStrings2 += m
//    }
    return localizedStrings
}

class regex: XCTestCase {
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        let string = """
        UIImage(named:"monalisa"),
        UIImage imageNamed:@"joconda"),
        Setting(name: "Subscribe", imageName: "purchase-a"),

        """
        print(string)

        let out = localizedStrings(inStringFile: string)
        print(out)
    }
}
