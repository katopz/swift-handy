//
//  KZDialog.swift
//  arn
//
//  Created by Pi R Square on 6/26/2558 BE.
//  Copyright © 2558 pirsquare. All rights reserved.
//

import Foundation
import UIKit

class KZDialog {
    
    // TODO : better use Enums?
    static var SORRY = "Sorry"
    static var ALERT = "Alert"
    static var THANK_YOU = "Thank you"
    static var OK = "OK"
    static var INTERNET_APPEAR_OFFLINE = "Internet connection appears to be offline."
    static var UNKNOWN_SERVER_ERROR = "Unknown server error."
    static var NO_EMAIL_CLIENT_FOUND = "No Email Client Found"
    
    static var isPresented_internetOffline:Bool  = false
    
    static func sorry_internetOffline(vc:UIViewController) {
        
        // already present
        if isPresented_internetOffline {
            return
        }
        
        isPresented_internetOffline = true
        
        let alert = UIAlertController(title: SORRY, message: INTERNET_APPEAR_OFFLINE, preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction(UIAlertAction(title: OK, style: UIAlertActionStyle.Default, handler: { action in
            self.isPresented_internetOffline = false
        }))
        vc.presentViewController(alert, animated: true, completion: nil)
    }
    
    static func alert(vc:UIViewController, message:String, handler: ((UIAlertAction) -> Void)?) {
        self.show(vc, title: THANK_YOU, message: message, handler: handler)
    }
    
    static func thank(vc:UIViewController, message:String, handler: ((UIAlertAction) -> Void)?) {
        self.show(vc, title: ALERT, message: message, handler: handler)
    }
    
    static func sorry(message:String) {
        self.show(SORRY, message:message)
    }
    
    static func show(vc:UIViewController, title:String, message:String, handler: ((UIAlertAction) -> Void)?) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction(UIAlertAction(title: OK, style: UIAlertActionStyle.Default, handler: handler))
        vc.presentViewController(alert, animated: true, completion: nil)
    }
    
    static func show(title:String, message:String) {
        let alert = UIAlertView()
        alert.title = title
        alert.message = message
        alert.addButtonWithTitle(OK)
        alert.show()
    }
}