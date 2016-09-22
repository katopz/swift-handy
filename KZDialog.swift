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
    
    // MARK: - Const
    
    // TODO : better use Enums?
    static let SORRY = "Sorry"
    static let ALERT = "Alert"
    static let WARNING = "Warning"
    static let THANK_YOU = "Thank you"
    static let OK = "OK"
    static let INTERNET_APPEAR_OFFLINE = "Internet connection appears to be offline."
    static let UNKNOWN_SERVER_ERROR = "Unknown server error."
    static let NO_EMAIL_CLIENT_FOUND = "No Email Client Found"
    
    static let PLEASE_TURN_ON_PUSH = "Please allow \"Push Notifications\" via \"Device Setting\" to get notify."
    
    // MARK: -  present anywhere
    
    static private func _present(_ alertController:UIAlertController) {
        var viewController = UIApplication.shared.keyWindow?.rootViewController
        while ((viewController?.presentedViewController) != nil) {
            viewController = viewController?.presentedViewController;
        }
        viewController?.present(alertController, animated: true, completion: nil)
    }
    
    // MARK: - Dialogs
    
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
        self.show(title:SORRY, message:message)
    }

    static func show(_ vc:UIViewController, title:String, message:String, handler: ((UIAlertAction?) -> Void)?) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: OK, style: UIAlertActionStyle.default, handler: handler))
        vc.present(alert, animated: true, completion: nil)
    }
    
    static func show(title:String, message:String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
        alertController.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler:nil))
        
        _present(alertController)
    }
    
    static func sheet(title:String, message:String, titles:[String?], handlers:[((UIAlertAction?) -> Void)?], cancelable:Bool = true) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.actionSheet)
        
        for (index, title) in titles.enumerated() {
            alertController.addAction(UIAlertAction(title: title, style: UIAlertActionStyle.default, handler: handlers[index]))
        }
        
        if(cancelable){
            alertController.addAction(UIAlertAction(title: "Cancel", style: UIAlertActionStyle.cancel, handler: nil))
        }
        
        _present(alertController)
    }
}
