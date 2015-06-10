//
//  KZSwift.swift
//  EnvatoMiner
//
//  Created by Todsaporn Banjerdkit on 6/9/15.
//  Copyright (c) 2015 Debokeh. All rights reserved.
//

import Foundation
import UIKit

func println(object: Any) {
    #if DEBUG
        Swift.println(object)
    #endif
}

class KZSwift {
    class var isSimulator: Bool {
        get {
            return TARGET_IPHONE_SIMULATOR != 0
        }
    }
    
    class var isH480: Bool {
        get {
            return UIScreen.mainScreen().bounds.height == 480
        }
    }
}