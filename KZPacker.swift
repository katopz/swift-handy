//
//  KZPacker.swift
//  swift-handy
//
//  Created by katopz on 5/19/2558 BE.
//  Copyright (c) 2558 Debokeh. All rights reserved.
//

import Foundation

class KZPacker {

    fileprivate static var _defaults = UserDefaults.standard
    
    static func pack(_ key:String, _ data:AnyObject) {
        _defaults.set(NSKeyedArchiver.archivedData(withRootObject: data), forKey: key)
        _defaults.synchronize()
    }
    
    static func unpack(_ key:String) -> AnyObject? {
        
        let data = _defaults.object(forKey: key) as? Data
        if data != nil {
            return NSKeyedUnarchiver.unarchiveObject(with: data!) as AnyObject?
        } else {
            return data as AnyObject?
        }
    }
    
    static func remove(_ key:String) {
        _defaults.removeObject(forKey: key)
    }
}
