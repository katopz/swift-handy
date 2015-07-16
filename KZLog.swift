//
//  KZLog.swift
//  arn
//
//  Created by Pi R Square on 6/23/2558 BE.
//  Copyright © 2558 pirsquare. All rights reserved.
//

import Foundation

var isDebug = true
func log(any1:Any, _ any2:Any? = nil) {
    if isDebug {
        if any2 != nil {
            println(any1, any2)
        } else {
            println(any1)
        }
    }
}