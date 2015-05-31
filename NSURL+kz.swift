//
//  NSURL+kz.swift
//  EnvatoMiner
//
//  Created by Todsaporn Banjerdkit on 6/1/15.
//  Copyright (c) 2015 Debokeh. All rights reserved.
//

import Foundation

extension NSURL
{
    static func openURLString(urlString:String?)
    {
        if(urlString != nil)
        {
            UIApplication.sharedApplication().openURL(NSURL(string: urlString!)!)
        } else {
            println(" ! NSURL.openURLString : nil" )
        }
    }
}