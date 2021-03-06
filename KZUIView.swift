//
//  KZUIView.swift
//  swift-handy
//
//  Created by katopz on 6/13/15.
//  Copyright (c) 2015 Debokeh. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    
    func doAlpha(_ value:Double) -> UIView {
        self.alpha = CGFloat(value)
        return self
    }
    
    func fadeIn(_ duration:Double, delay: Double = 0, completion: ((Bool) -> Void)? = nil) {
        UIView.animate(withDuration: duration, delay: delay, options:.curveEaseOut, animations: {
            self.alpha = 1
        }, completion: completion)
    }
    
    func fadeOut(_ duration:Double, delay: Double = 0, completion: ((Bool) -> Void)? = nil) {
        UIView.animate(withDuration: duration, delay: delay, options:.curveEaseOut, animations: {
            self.alpha = 0
            }, completion: completion)
    }
    
    func removeAllSubViews()
    {
        for subView :AnyObject in self.subviews
        {
            subView.removeFromSuperview()
        }
    }
}
