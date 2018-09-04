//
//  ViewController.swift
//  Swift4Util
//
//  Created by Rudolf Farkas on 18.06.18.
//  Copyright © 2018 Rudolf Farkas. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        printClassAndFunc(info: "more info...")
    }

    override func viewWillAppear(_ animated: Bool) {
        printClassAndFunc()
    }

    override func viewWillDisappear(_ animated: Bool) {
        printClassAndFunc()
    }

    deinit {
        printClassAndFunc()
    }
}
