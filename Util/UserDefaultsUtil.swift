//
//  UserSettingsUtil.swift v.0.1.0
//  Swift4Util
//
//  Created by Rudolf Farkas on 22.07.19.
//  Copyright © 2019 Rudolf Farkas. All rights reserved.
//

import Foundation

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
