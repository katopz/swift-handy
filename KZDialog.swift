//
//  KZDialog.swift
//  swift-handy
//
//  Created by katopz on 6/26/2558 BE.
//  Copyright © 2558 Debokeh. All rights reserved.
//

import Foundation
import UIKit

class KZDialog {
    
    // TODO : better use Enums?
    static var SORRY = "Sorry"
    static var ALERT = "Alert"
    static var WARNING = "Warning"
    static var THANK_YOU = "Thank you"
    static var OK = "OK"
    static var INTERNET_APPEAR_OFFLINE = "Internet connection appears to be offline."
    static var UNKNOWN_SERVER_ERROR = "Unknown server error."
    static var NO_EMAIL_CLIENT_FOUND = "No Email Client Found"
    
    static var PLEASE_TURN_ON_PUSH = "Please allow \"Push Notifications\" via \"Device Setting\" to get notify."
    
    static var isPresented_internetOffline:Bool  = false
    
    static func sorry_internetOffline(_ vc:UIViewController) {
        
        // already present
        if isPresented_internetOffline {
            return
        }
        
        isPresented_internetOffline = true
        
        let alert = UIAlertController(title: SORRY, message: INTERNET_APPEAR_OFFLINE, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: OK, style: UIAlertActionStyle.default, handler: { action in
            self.isPresented_internetOffline = false
        }))
        vc.present(alert, animated: true, completion: nil)
    }
    
    static func alert(_ vc:UIViewController, message:String, handler: ((UIAlertAction?) -> Void)?) {
        self.show(vc, title: THANK_YOU, message: message, handler: handler)
    }
    
    static func thank(_ vc:UIViewController, message:String, handler: ((UIAlertAction?) -> Void)?) {
        self.show(vc, title: ALERT, message: message, handler: handler)
    }
    
    static func sorry(_ message:String) {
        self.show(SORRY, message:message)
    }

    static func show(_ vc:UIViewController, title:String, message:String, handler: ((UIAlertAction?) -> Void)?) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: OK, style: UIAlertActionStyle.default, handler: handler))
        vc.present(alert, animated: true, completion: nil)
    }
    
    static func show(_ title:String, message:String) {
        let alert = UIAlertView()
        alert.title = title
        alert.message = message
        alert.addButton(withTitle: OK)
        alert.show()
    }
}
