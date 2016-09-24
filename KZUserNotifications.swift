//
//  KZUserNotifications.swift
//  swift-handy
//
//  Created by Todsaporn Banjerdkit on 9/23/16.
//  Copyright © 2016 Debokeh. All rights reserved.
//

//  http://stackoverflow.com/questions/37956482/registering-for-push-notifications-in-xcode-8-swift-3-0

import Foundation
import UIKit
import UserNotifications

public extension UIDevice {
    
    static func checkAllowedPushNotifications(_ handler:@escaping ((Bool!) -> Void)) {
        
        /*
         //For test
        if (KZSwift.isSimulator) {
            handler(false)
            return;
         }
         */
        
        if #available(iOS 10.0, *) {
            // iOS 10+
            UNUserNotificationCenter.current().getNotificationSettings { settings in
                handler(settings.authorizationStatus == .authorized)
            }
        } else {
            // iOS 8, 9
            if UIApplication.shared.responds(to: #selector(getter: UIApplication.currentUserNotificationSettings)) {
                let types = UIApplication.shared.currentUserNotificationSettings!.types
                let isAllowed = (types.intersection(UIUserNotificationType.alert)) != UIUserNotificationType()
                handler(isAllowed);
            } else {
                handler(UIApplication.shared.isRegisteredForRemoteNotifications)
            }
        }
    }
}
