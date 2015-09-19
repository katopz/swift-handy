//
//  KZPath.swift
//
//  Created by Pi R Square on 7/16/2558 BE.
//  Copyright © 2558 pirsquare. All rights reserved.
//

import Foundation

class KZPath {
    
    static func getBundleFilePath(fileFullName:String) -> String {
        let fileName = NSURL(fileURLWithPath: fileFullName).URLByDeletingPathExtension
        let fileExtention = NSURL(fileURLWithPath: fileFullName).pathExtension
        
        return NSBundle.mainBundle().pathForResource(fileName, ofType: fileExtention) ?? fileFullName
    }
}