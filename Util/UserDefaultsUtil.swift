//
//  UserSettingsUtil.swift v.0.1.0
//  Swift4Util
//
//  Created by Rudolf Farkas on 22.07.19.
//  Copyright © 2019 Rudolf Farkas. All rights reserved.
//

import Foundation

extension UserDefaults {
    private func encode<AStruct: Codable>(value: AStruct) throws -> Data {
        return try JSONEncoder().encode(value)
    }

    private func decode<AStruct: Codable>(from data: Data) throws -> AStruct {
        return try JSONDecoder().decode(AStruct.self, from: data)
    }

    func set<AStruct: Codable>(value: AStruct, forKey key: String) {
        if let encoded = try? encode(value: value) {
            set(encoded, forKey: key)
        }
    }

    func get<AStruct: Codable>(forKey key: String) -> AStruct? {
        if let data = self.object(forKey: key) as? Data {
            if let value: AStruct = try? decode(from: data) {
                return value
            }
        }
        return nil
    }

    func remove(forKey key: String) {
        removeObject(forKey: key)
    }
}
