//
//  AppDefaults.swift v.0.1.0
//  Swift4Util
//
//  Created by Rudolf Farkas on 08.07.19.
//  Copyright © 2019 Rudolf Farkas. All rights reserved.
//

import Foundation

/// Utility for saving to and restoring from UserDefaults.standard arbitrary structs
struct AppDefaults<Struct: Codable> {
    /// Look up data for the setting key
    ///
    /// - Parameter key: setting key
    /// - Returns: setting data value (nil if absent from UserDefaults)
    private static func data(for key: String) -> Data? {
        return UserDefaults.standard.object(forKey: key) as? Data
    }

    /// Look up the value for the setting key in
    ///
    /// - Parameter key: setting key
    /// - Returns: setting value (nil if absent from UserDefaults.standard)
    static func setting(for key: String) -> Struct? {
        if let data = UserDefaults.standard.data(forKey: key) {
            if let prefLang = try? Struct.decode(from: data) {
                return prefLang
            }
        }
        return nil
    }

    /// Save the value in UserDefaults.standard
    ///
    /// - Parameters:
    ///   - value: to save in UserDefaults
    ///   - key:  setting key
    /// - Returns: true if successful
    static func set(_ value: Struct, forKey key: String) -> Bool {
        if let encoded = try? value.encode() {
            UserDefaults.standard.set(encoded, forKey: key)
            return true
        }
        return false
    }
}

