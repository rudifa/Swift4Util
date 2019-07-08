//
//  AppDefaults.swift v.0.1.0
//  Swift4Util
//
//  Created by Rudolf Farkas on 08.07.19.
//  Copyright © 2019 Rudolf Farkas. All rights reserved.
//

import Foundation

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

