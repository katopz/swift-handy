//
//  KZUIImageView.swift
//  swift-handy
//
//  Created by katopz on 7/13/2558 BE.
//  Copyright © 2558 Debokeh. All rights reserved.
//

import Foundation
extension UIImageView {
    public func imageFromUrl(urlString: String) {
        if let url = NSURL(string: urlString) {
            let request = NSURLRequest(URL: url)
            NSURLConnection.sendAsynchronousRequest(request, queue: NSOperationQueue.mainQueue()) {
                (response: NSURLResponse?, data: NSData?, error: NSError?) -> Void in
                if data == nil {
                    return
                }
                self.image = UIImage(data: data!)
            }
        }
    }
    
    public func imageFromBundle(uriString: String) {
        self.image = UIImage(contentsOfFile: uriString)
    }
}