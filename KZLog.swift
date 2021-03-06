//
//  KZLog.swift
//  swift-handy
//
//  Created by katopz on 6/23/2558 BE.
//  Copyright © 2558 Debokeh. All rights reserved.
//

import Foundation

var isDebug = true
func log(_ any1:Any, _ any2:Any? = nil) {
    if isDebug {
        if any2 != nil {
            print("[log]\(any1)", "\(any2)")
        } else {
            print("[log]\(any1)")
        }
    }
}
