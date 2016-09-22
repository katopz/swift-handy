//
//  KZUIDevice.swift
//  swift-handy
//
//  Created by katopz on 7/16/15.
//  Copyright (c) 2015 Debokeh. All rights reserved.
//  http://stackoverflow.com/questions/26028918/ios-how-to-determine-iphone-model-in-swift/27903805#27903805
//  https://github.com/dennisweissmann/DeviceKit/blob/swift-2.3-unsupported/Source/Device.swift
//  http://stackoverflow.com/questions/37956482/registering-for-push-notifications-in-xcode-8-swift-3-0

import Foundation
import UIKit
import UserNotifications

private let DeviceList = [
    /* iPod 5 */          "iPod5,1": "iPod Touch 5",
    /* iPhone 4 */        "iPhone3,1":  "iPhone 4", "iPhone3,2": "iPhone 4", "iPhone3,3": "iPhone 4",
    /* iPhone 4S */       "iPhone4,1": "iPhone 4S",
    /* iPhone 5 */        "iPhone5,1": "iPhone 5", "iPhone5,2": "iPhone 5",
    /* iPhone 5C */       "iPhone5,3": "iPhone 5C", "iPhone5,4": "iPhone 5C",
    /* iPhone 5S */       "iPhone6,1": "iPhone 5S", "iPhone6,2": "iPhone 5S",
    /* iPhone 6 */        "iPhone7,2": "iPhone 6",
    /* iPhone 6 Plus */   "iPhone7,1": "iPhone 6 Plus",
    /* iPhone 6S */       "iPhone8,1": "iPhone 6S",
    /* iPhone 6S Plus */  "iPhone8,2": "iPhone 6S Plus",
                          
    /* iPhone 7 */        "iPhone9,1": "iPhone 7",
    /* iPhone 7 Plus */   "iPhone9,2": "iPhone 7 Plus",
    /* iPhone 7 */        "iPhone9,3": "iPhone 7",
    /* iPhone 7 Plus */   "iPhone9,4": "iPhone 7 Plus",
                         
    /* iPad 2 */          "iPad2,1": "iPad 2", "iPad2,2": "iPad 2", "iPad2,3": "iPad 2", "iPad2,4": "iPad 2",
    /* iPad 3 */          "iPad3,1": "iPad 3", "iPad3,2": "iPad 3", "iPad3,3": "iPad 3",
    /* iPad 4 */          "iPad3,4": "iPad 4", "iPad3,5": "iPad 4", "iPad3,6": "iPad 4",
    /* iPad Air */        "iPad4,1": "iPad Air", "iPad4,2": "iPad Air", "iPad4,3": "iPad Air",
    /* iPad Air 2 */      "iPad5,1": "iPad Air 2", "iPad5,3": "iPad Air 2", "iPad5,4": "iPad Air 2",
    /* iPad Mini */       "iPad2,5": "iPad Mini", "iPad2,6": "iPad Mini", "iPad2,7": "iPad Mini",
    /* iPad Mini 2 */     "iPad4,4": "iPad Mini", "iPad4,5": "iPad Mini", "iPad4,6": "iPad Mini",
    /* iPad Mini 3 */     "iPad4,7": "iPad Mini", "iPad4,8": "iPad Mini", "iPad4,9": "iPad Mini",
    /* Simulator */       "x86_64": "Simulator", "i386": "Simulator"
]

public extension UIDevice {
    
    var modelName: String {
        var systemInfo = utsname()
        uname(&systemInfo)
        
        let machine = systemInfo.machine
        let mirror = Mirror(reflecting:machine)
        var identifier = ""
        
        for child in mirror.children where child.value as? Int8 != 0 {
            identifier.append(String(UnicodeScalar(UInt8(child.value as! Int8))))
        }
        return DeviceList[identifier] ?? identifier
    }
    
    var isAllowedPushNotifications: Bool {
        if #available(iOS 10.0, *) {
            // iOS 10+
            var isAllowed = false
            UNUserNotificationCenter.current().getNotificationSettings(){ (setttings) in
                switch setttings.soundSetting{
                case .enabled:
                    print("enabled sound setting")
                    isAllowed = true
                    break;
                case .disabled:
                    print("setting has been disabled")
                    isAllowed = false
                    break;
                case .notSupported:
                    print("something vital went wrong here")
                    isAllowed = false
                    break;
                }
            }
            return isAllowed
        } else {
            // iOS 8, 9
            if UIApplication.shared.responds(to: #selector(getter: UIApplication.currentUserNotificationSettings)) {
                let types = UIApplication.shared.currentUserNotificationSettings!.types
                let isAllowed = (types.intersection(UIUserNotificationType.alert)) != UIUserNotificationType()
                return isAllowed;
            } else {
                return UIApplication.shared.isRegisteredForRemoteNotifications
            }
        }
    }
}
