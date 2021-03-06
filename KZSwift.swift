//
//  KZSwift.swift
//  swift-handy
//
//  Created by katopz on 6/9/15.
//  Copyright (c) 2015 Debokeh. All rights reserved.
//

import Foundation
import UIKit

class KZSwift {
    class var isSimulator: Bool {
        get {
            return TARGET_IPHONE_SIMULATOR != 0
        }
    }
    
    class var isH480: Bool {
        get {
            return UIScreen.main.bounds.height == 480
        }
    }
}
