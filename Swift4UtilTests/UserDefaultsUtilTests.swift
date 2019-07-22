//
//  UserSettingsUtilTests.swift v.0.1.0
//  Swift4UtilTests
//
//  Created by Rudolf Farkas on 22.07.19.
//  Copyright © 2019 Rudolf Farkas. All rights reserved.
//

import XCTest

class UserSettingsUtilTests: XCTestCase {
    struct Language: Codable, Equatable {
        var name: String
        var version: String
    }

    override func setUp() {}
    override func tearDown() {}

    func test_extensionUserDefaults() {
        let defaults = UserDefaults.standard
        let languageKey = "defaultLanguage"

        // create an instance
        let testLanguage = Language(name: "Swift", version: "4")

        // save in defaults
        defaults.set(value: testLanguage, forKey: languageKey)

        // restore from defaults should succeed
        if let language: Language = defaults.get(forKey: languageKey) {
            XCTAssertEqual(language, testLanguage)
        } else {
            XCTAssert(false)
        }

        // remove from defaults
        defaults.remove(forKey: languageKey)

        // restore from defaults should fail
        if let language: Language = defaults.get(forKey: languageKey) {
            XCTAssertNil(language)
        }
    }
}

/*
 // usage sample:

 struct Language: Codable {
 var name: String
 var version: String
 }

 // create an instance
 let language = Language(name: "Swift", version: "4")

 // encode
 if let data = try? language.encode() {
 // use data here
 }

 // decode
 if let lang = try? Language.decode(from: data!) {
 // use lang here
 }
 */

/*
 extension UserDefaults {
 func set<AStruct: Codable>(value: AStruct, forKey key: String) {
 if let encoded = try? value.encode() {
 set(encoded, forKey: key)
 }
 }

 func get<AStruct: Codable>(forKey key: String) -> AStruct? {
 if let data = self.object(forKey: key) as? Data {
 if let value = try? AStruct.decode(from: data) {
 return value
 }
 }
 return nil
 }

 func remove(forKey key: String) {
 removeObject(forKey: key)
 }
 }

 */
