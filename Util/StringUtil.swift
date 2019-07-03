//
//  StringUtil.swift v.0.2.1
//  Swift4Util
//
//  Created by Rudolf Farkas on 22.07.18.
//  Copyright © 2018 Rudolf Farkas. All rights reserved.
//

import Foundation

extension String {
    /// Split into [String] of single-character elements
    ///
    /// - Returns: [String]
    func split() -> [String] {
        return map { String($0) }
    }

    /// Split into [String] using separator (possibly repeated)
    ///
    /// - Parameter separator: Character
    /// - Returns: [String]
    ///
    /// - Example: "his obsessions" -> ["hi", " ob", "e", "ion"]
    func split(separator: Character) -> [String] {
        return split(separator: separator, omittingEmptySubsequences: true).map { String($0) }
    }
}

extension String {
    func capitalizingFirstLetter() -> String {
        return prefix(1).capitalized + dropFirst()
    }

    mutating func capitalizeFirstLetter() {
        self = capitalizingFirstLetter()
    }

    /// Capitalizes 1st letter and inserts a space before any other capital letter
    var camelCaseSplit: String {
        var newString: String = prefix(1).capitalized
        for char in dropFirst() {
            if "A" ... "Z" ~= char, newString != "" {
                newString.append(" ")
            }
            newString.append(char)
        }
        return newString
    }
}

extension Array where Element: StringProtocol {
    /// Join [String] elements with ""
    ///
    /// - Returns: String
    func joined() -> String {
        return joined(separator: "")
    }
}
