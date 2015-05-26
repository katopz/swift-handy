//
//  KZPacker.swift
//  swift-handy
//
//  Created by katopz on 5/19/2558 BE.
//  Copyright (c) 2558 Debokeh. All rights reserved.
//

import Foundation

class KZPacker {
    
    /*
    let string = "{\"foo\":\"bar\"}"
    let key = "foos"
    var old_data = [1:string, 2:string, 3:string]
    var new_data = [2:string, 4:string]
    
    // save
    KZPacker.pack(key, old_data)
    
    // load
    var data = KZPacker.unpack(key) as! [Int:String]
    println("get    : \(data)")
    
    // sort
    var sorted_data = sorted(data) { $0.0 > $1.0 }
    println("sorted : \(sorted_data)")
    
    // merge
    for item in new_data {
        old_data[item.0] = item.1
    }
    println("merged : \(old_data)")
    
    // remove
    println("remove : " + key)
    KZPacker.remove(key)
    
    if let del_data = KZPacker.unpack(key) as? [Int:String] {
        println(" This should be seen : \(del_data)")
    }
    */
    
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