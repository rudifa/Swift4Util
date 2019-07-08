//
//  UserDefaultsUtilTests.swift
//  Swift4UtilTests
//
//  Created by Rudolf Farkas on 08.07.19.
//  Copyright © 2019 Rudolf Farkas. All rights reserved.
//

import XCTest

struct ProgLang: Codable, Equatable {
    var name: String
    var version: String
}

extension UserDefaults {
    func data(for key: String) -> Data? {
        return object(forKey: key) as? Data
    }

    func setting(for key: String) -> ProgLang? {
        if let data = UserDefaults.standard.data(for: key) {
            if let prefLang = try? ProgLang.decode(from: data) {
                return prefLang
            }
        }
        return nil
    }
}

class AppDefaults1 {
    static let defaults = UserDefaults.standard

    static func data(for key: String) -> Data? {
        return defaults.object(forKey: key) as? Data
    }

    static func setting(for key: String) -> ProgLang? {
        if let data = defaults.data(for: key) {
            if let prefLang = try? ProgLang.decode(from: data) {
                return prefLang
            }
        }
        return nil
    }
}

class AppDefaults<SomeStruct: Codable> {
    static func data(for key: String) -> Data? {
        return UserDefaults.standard.object(forKey: key) as? Data
    }

    static func setting(for key: String) -> SomeStruct? {
        if let data = UserDefaults.standard.data(for: key) {
            if let prefLang = try? SomeStruct.decode(from: data) {
                return prefLang
            }
        }
        return nil
    }
}

// extension UserDefaults<Struct> { //Cannot specialize non-generic type 'UserDefaults'
//    func data(for key: String) -> Data? {
//        return object(forKey: key) as? Data
//    }
//
//    func setting(for key: String) -> ProgLang? {
//        if let data = UserDefaults.standard.data(for: key) {
//            if let prefLang = try? ProgLang.decode(from: data) {
//                return prefLang
//            }
//        }
//        return nil
//    }
// }

class UserDefaultsUtilTests: XCTestCase {
    let prefLangKey = "preferredLanguage"

    override func setUp() {}
    override func tearDown() {}

    func test_UserDefaultsUtil_1() {
        // try to get from UserDefaults

        if let data = UserDefaults.standard.object(forKey: prefLangKey) as? Data,
            let prefLang = try? ProgLang.decode(from: data) {
            // use data
            printClassAndFunc(info: "0, \(prefLang)")
        } else {
            //            XCTAssertTrue(true)
            printClassAndFunc(info: "0  nil")
        }

        let prefLang = ProgLang(name: "Swift", version: "5.0")
        // save to UserDefaults
        if let encoded = try? prefLang.encode() {
            UserDefaults.standard.set(encoded, forKey: prefLangKey)
        }

        // try again to get from UserDefaults
        if let data = UserDefaults.standard.object(forKey: prefLangKey) as? Data,
            let prefLang = try? ProgLang.decode(from: data) {
            // use data
            printClassAndFunc(info: "1, \(prefLang)")
        } else {
            //            XCTAssertTrue(true)
            printClassAndFunc(info: "1  nil")
            print(1, "nil")
        }

        UserDefaults.standard.removeObject(forKey: prefLangKey)

        // try yet again to get from UserDefaults
        if let data = UserDefaults.standard.object(forKey: prefLangKey) as? Data,
            let prefLang = try? ProgLang.decode(from: data) {
            // use data
            printClassAndFunc(info: "2, \(prefLang)")
        } else {
            //            XCTAssertTrue(true)
            printClassAndFunc(info: "2  nil")
        }
    }

    func test_UserDefaultsUtil_2() { /////////////////////////
        do {
            if let data = UserDefaults.standard.data(for: prefLangKey) {
                printClassAndFunc(info: "-1a, \(String(describing: data))")

                if let prefLang = try? ProgLang.decode(from: data) {
                    printClassAndFunc(info: "-1b, \(prefLang)")
                } else {
                    printClassAndFunc(info: "-1c nil")
                }
            } else {
                printClassAndFunc(info: "-1d nil")
            }
        }

        do {
            if let data = UserDefaults.standard.object(forKey: prefLangKey) as? Data {
                if let prefLang = try? ProgLang.decode(from: data) {
                    // use data
                    printClassAndFunc(info: "0a, \(prefLang)")
                } else {
                    printClassAndFunc(info: "0b nil")
                }
            } else {
                //            XCTAssertTrue(true)
                printClassAndFunc(info: "0c nil")
            }
        }

        do {
            let val = UserDefaults.standard.setting(for: prefLangKey)
            XCTAssertNil(val)
        }

        do {
            let val = AppDefaults1.setting(for: prefLangKey)
            XCTAssertNil(val)
        }

        do {
            let val = AppDefaults<ProgLang>.setting(for: prefLangKey)
            XCTAssertNil(val)
        }

        let prefLang = ProgLang(name: "Swift", version: "5.0")
        // save to UserDefaults
        if let encoded = try? prefLang.encode() {
            UserDefaults.standard.set(encoded, forKey: prefLangKey)
        }

        // try again to get from UserDefaults
        if let data = UserDefaults.standard.object(forKey: prefLangKey) as? Data,
            let prefLang = try? ProgLang.decode(from: data) {
            // use data
            printClassAndFunc(info: "1, \(prefLang)")
        } else {
            //            XCTAssertTrue(true)
            printClassAndFunc(info: "1 nil")
        }

        do {
            let val = UserDefaults.standard.setting(for: prefLangKey)
            XCTAssertEqual(val, prefLang)
        }

        do {
            let val = AppDefaults1.setting(for: prefLangKey)
            XCTAssertEqual(val, prefLang)
        }

        do {
            let val = AppDefaults<ProgLang>.setting(for: prefLangKey)
            XCTAssertEqual(val, prefLang)
        }

        UserDefaults.standard.removeObject(forKey: prefLangKey)

        // try yet again to get from UserDefaults
        if let data = UserDefaults.standard.object(forKey: prefLangKey) as? Data,
            let prefLang = try? ProgLang.decode(from: data) {
            // use data
            printClassAndFunc(info: "2, \(prefLang)")
        } else {
            //            XCTAssertTrue(true)
            printClassAndFunc(info: "2 nil")
        }

        do {
            let val = UserDefaults.standard.setting(for: prefLangKey)
            XCTAssertNil(val)
        }

        do {
            let val = AppDefaults1.setting(for: prefLangKey)
            XCTAssertNil(val)
        }

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

/*

 // try to get from UserDefaults
 if let data = UserDefaults.standard.object(forKey: key) as? Data {
 if let lastValid = try? SubscriptionManager.Subscription.decode(from: data) {
 cachedSubscription = lastValid
 }
 }

 if let encoded = try? purchasedSubscription.encode() {
 // save to UserDefaults
 UserDefaults.standard.set(encoded, forKey: self.key)
 }

 UserDefaults.standard.removeObjectForKey("phone")

 */

//    struct ProgLang: Codable {
//        var name: String
//        var version: String
//    }
//
//    // create an instance
//    let language = ProgLang(name: "Swift", version: "4")
//
//    // encode
//    if let data = try? ProgLang.encode() {
//        // use data here
//    }
//
//    // decode
//    if let lang = try? ProgLang.decode(from: data!) {
//        // use lang here
//    }
