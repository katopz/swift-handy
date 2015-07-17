//
//  UIWebView+KZ.swift
//  arn
//
//  Created by Pi R Square on 7/17/2558 BE.
//  Copyright © 2558 pirsquare. All rights reserved.
//

import Foundation

extension UIWebView {
    
    public var selectedString:String {
        get {
            return self.stringByEvaluatingJavaScriptFromString("document.documentElement.style.webkitUserSelect='none'") ?? ""
        }
    }
}