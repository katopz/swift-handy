//
//  KZURL.swift
//  swift-handy
//
//  Created by katopz on 6/1/15.
//  Copyright (c) 2015 Debokeh. All rights reserved.
//

import Foundation
import UIKit

extension URL
{
    static func openURLString(_ urlString:String?)
    {
        if(urlString != nil)
        {
            if #available(iOS 10.0, *) {
                UIApplication.shared.open(URL(string: urlString!)!, options: [:], completionHandler: nil)
            } else {
                UIApplication.shared.openURL(URL(string: urlString!)!)
            }
        } else {
            //println(" ! NSURL.openURLString : nil" )
        }
    }
}
