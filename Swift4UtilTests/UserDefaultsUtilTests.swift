//
//  UserDefaultsUtilTests.swift v.0.1.0
//  Swift4UtilTests
//
//  Created by Rudolf Farkas on 08.07.19.
//  Copyright © 2019 Rudolf Farkas. All rights reserved.
//

import XCTest

class AppDefaults<Struct: Codable> {
    static func data(for key: String) -> Data? {
        return UserDefaults.standard.object(forKey: key) as? Data
    }

    static func setting(for key: String) -> Struct? {
        if let data = UserDefaults.standard.data(forKey: key) {
            if let prefLang = try? Struct.decode(from: data) {
                return prefLang
            }
        }
        return nil
    }

    static func set(_ value: Struct, forKey key: String) -> Bool {
        if let encoded = try? value.encode() {
            UserDefaults.standard.set(encoded, forKey: key)
            return true
        }
        return false
    }
}

class UserDefaultsUtilTests: XCTestCase {
    let prefLangKey = "preferredLanguage"

    struct ProgLang: Codable, Equatable {
        var name: String
        var version: String
    }

    override func setUp() {}
    override func tearDown() {}


    func test_AppDefaults() {
        // try to get from AppDefaults

        do {
            let val = AppDefaults<ProgLang>.setting(for: prefLangKey)
            XCTAssertNil(val)
        }

        // save to AppDefaults

        let prefLang = ProgLang(name: "Swift", version: "5.0")
        if let encoded = try? prefLang.encode() {
            UserDefaults.standard.set(encoded, forKey: prefLangKey)
        }

        do {
            let saved = AppDefaults.set(prefLang, forKey: prefLangKey)
            XCTAssertTrue(saved)
        }

        // try again to get from UserDefaults

        do {
            let val = AppDefaults<ProgLang>.setting(for: prefLangKey)
            XCTAssertEqual(val, prefLang)
        }

        // remove from AppDefaults

        UserDefaults.standard.removeObject(forKey: prefLangKey)

        do {
            let val = AppDefaults<ProgLang>.setting(for: prefLangKey)
            XCTAssertNil(val)
        }

        do {
            let val: ProgLang? = AppDefaults.setting(for: prefLangKey)
            XCTAssertNil(val)
        }
    }
}

