//
//  DictUtilTests.swift
//  Swift4UtilTests
//
//  Created by Rudolf Farkas on 30.06.18.
//  Copyright © 2018 Rudolf Farkas. All rights reserved.
//

import XCTest

class DictUtilTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    

    func testHashablePair() {

        enum State {
            case black, red, green, blue
        }

        enum Event {
            case done, cancel, reset
        }

        typealias State_Event = HashablePair<State, Event>

        let dictionary: Dictionary<State_Event, State> = [
            State_Event(.black, .cancel): .red,
            State_Event(.black, .done): .black,
            State_Event(.red, .cancel): .black,
            State_Event(.red, .done): .green,
            State_Event(.green, .cancel): .black,
            State_Event(.green, .done): .blue,
            State_Event(.blue, .cancel): .black,
            State_Event(.blue, .done): .red,
            ]

        for (key, _) in dictionary {
            print("hash of key=", key.hashValue)
        }

    }

}
