//
//  KZNSBundle.swift
//	swift-handy
//
//  Created by katopz on 5/9/15.
//  Copyright (c) 2015 Debokeh. All rights reserved.
//

extension Bundle {
    
    class var applicationVersionNumber: String {
        if let version = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String {
            return version
        }
        return "Version Number Not Available"
    }
    
    class var applicationBuildNumber: String {
        if let build = Bundle.main.infoDictionary?["CFBundleVersion"] as? String {
            return build
        }
        return "Build Number Not Available"
    }
}
