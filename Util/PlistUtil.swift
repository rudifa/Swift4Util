//
//  PlistUtil.swift
//  StructCodable
//
//  Created by Rudolf Farkas on 15.08.18.
//  Copyright © 2018 Rudolf Farkas. All rights reserved.
//

import Foundation

extension PropertyListEncoder {
    convenience init(fmt: PropertyListSerialization.PropertyListFormat = .xml) {
        self.init()
        outputFormat = fmt
    }
}

