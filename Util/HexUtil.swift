//
//  HexUtil.swift
//  Swift4Util
//
//  Created by Rudolf Farkas on 15.08.18.
//  Copyright © 2018 Rudolf Farkas. All rights reserved.
//

import Foundation


extension String {
    var hexDump: String {
        let arr = self.unicodeScalars.map {
            String($0.value, radix: 16, uppercase: true)
        }
        return arr.joined(separator: " ")
    }

    func hexdump(step: Int = 10) {
        for i in stride(from: 0, to: self.count, by: step) {
            let sub = self.dropFirst(i).prefix(step) as Substring
            print(sub)
        }
    }

    // TODO:
    // make a hexdumper that returns an array of dump lines, with 8 chars per line, hex and unicode
    // probably should break up into characters, stride & make a dump line for each n characters

}
