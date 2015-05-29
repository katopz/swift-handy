//
//  KZPacker.swift
//  swift-handy
//
//  Created by katopz on 5/19/2558 BE.
//  Copyright (c) 2558 Debokeh. All rights reserved.
//

import Foundation

class KZPacker {

    private static var _defaults = NSUserDefaults.standardUserDefaults()
    
    static func pack(key:String, _ data:AnyObject) {
        _defaults.setObject(NSKeyedArchiver.archivedDataWithRootObject(data), forKey: key)
        _defaults.synchronize()
    }
    
    static func unpack(key:String) -> AnyObject? {
        
        let data = _defaults.objectForKey(key) as? NSData
        if data != nil {
            return NSKeyedUnarchiver.unarchiveObjectWithData(data!)
        } else {
            return data
        }
    }
    
    static func remove(key:String) {
        _defaults.removeObjectForKey(key)
    }
}
