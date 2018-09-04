//
//  UIUtil.swift v.0.1.0
//  Swift4Util
//
//  Created by Rudolf Farkas on 04.09.18.
//  Copyright © 2018 Rudolf Farkas. All rights reserved.
//

import UIKit

// Create a UIWindow with a UIViewController to present UIAlertController on it.
// http://lazyself.io/ios/2017/05/18/present-uialertcontroller-when-not-in-a-uiviewcontroller.html

extension UIAlertController {
    /// present alert from a (possibly) non-UIViewController object
    func show() {
        let window = UIWindow(frame: UIScreen.main.bounds)
        window.rootViewController = UIViewController()
        window.windowLevel = UIWindowLevelAlert
        window.makeKeyAndVisible()
        window.rootViewController?.present(self, animated: false, completion: nil)
    }
}

extension NSObject {
    /// print current class and function names
    func printClassAndFunc(_ funct: String = #function) {
        print("----", String(describing: type(of: self)), funct)
    }
}

