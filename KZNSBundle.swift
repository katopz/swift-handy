//
//  KZNSBundle.swift
//	swift-handy
//
//  Created by Todsaporn Banjerdkit on 5/9/15.
//  Copyright (c) 2015 Debokeh. All rights reserved.
//

extension NSBundle {
    
    class var applicationVersionNumber: String {
        if let version = NSBundle.mainBundle().infoDictionary?["CFBundleShortVersionString"] as? String {
            return version
        }
        return "Version Number Not Available"
    }
    
    class var applicationBuildNumber: String {
        if let build = NSBundle.mainBundle().infoDictionary?["CFBundleVersion"] as? String {
            return build
        }
        return "Build Number Not Available"
    }
}