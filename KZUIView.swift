//
//  KZUIView.swift
//  EnvatoMiner
//
//  Created by Todsaporn Banjerdkit on 6/13/15.
//  Copyright (c) 2015 Debokeh. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    
    func doAlpha(value:Double) -> UIView {
        self.alpha = CGFloat(value)
        return self
    }
    
    func fadeIn(duration:Double, delay: Double = 0, completion: ((Bool) -> Void)? = nil) {
        UIView.animateWithDuration(duration, delay: delay, options:.CurveEaseOut, animations: {
            self.alpha = 1
        }, completion: completion)
    }
    
    func fadeOut(duration:Double, delay: Double = 0, completion: ((Bool) -> Void)? = nil) {
        UIView.animateWithDuration(duration, delay: delay, options:.CurveEaseOut, animations: {
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