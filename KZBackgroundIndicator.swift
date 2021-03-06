//
//  KZBackgroundIndicator.swift
//  swift-handy
//
//  Created by katopz on 6/3/15.
//  Copyright (c) 2015 Debokeh. All rights reserved.
//

import Foundation
import UIKit

class KZBackgroundIndicator: UIView {
    
    static var _maps:[UIView:UIColor] = [UIView:UIColor]()
    static var _new_backgroundColor:UIColor?
    
    static var _isPlay:Bool = false
    
    static func startAnimation(_ target:UIView, color:UIColor) {
        
        // already play
        if(_isPlay) {
            return
        }
        
        if(_maps[target] == nil) {
            _maps[target] = target.backgroundColor
        }
        
        _new_backgroundColor = color
        
        _isPlay = true
        
        UIView.animate(withDuration: 1, delay: 0, options:.curveEaseOut, animations: {
            
            target.backgroundColor = self._new_backgroundColor
            
            }, completion: {finished in
                
                if(self._isPlay) {
                    UIView.animate(withDuration: 0.5, delay: 0, options:.curveEaseOut, animations: {
                        
                        target.backgroundColor = self._maps[target]
                        
                        }, completion: {finished in
                            
                            if(self._isPlay) {
                                self._isPlay = false
                                self.startAnimation(target, color: self._new_backgroundColor!)
                            }
                    })
                }
        })
    }
    
    static func stopAnimation(_ target:UIView) {
        
        _isPlay = false
        
        if self._maps[target] == nil {
            return
        }
        
        UIView.animate(withDuration: 0.5, delay: 0, options:.curveEaseOut, animations: {
            
            target.backgroundColor = self._maps[target]
            
            }, completion: {finished in
                //
        })
        
        self._maps[target] = nil
        _new_backgroundColor = nil
    }
}
