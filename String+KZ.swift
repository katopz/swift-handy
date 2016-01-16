//
//  NSString+KZ.swift
//  swift-handy
//
//  Created by katopz on 1/16/2559 BE.
//  Copyright © 2559 Debokeh. All rights reserved.
//

import Foundation

extension String {
    func replace(target:String, with:String) -> String {
        return self.componentsSeparatedByString(target).joinWithSeparator(with)
    }
}