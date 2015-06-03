//
//  KZBackgroundIndicator.swift
//  EnvatoMiner
//
//  Created by Todsaporn Banjerdkit on 6/3/15.
//  Copyright (c) 2015 Debokeh. All rights reserved.
//

import Foundation

class KZBackgroundIndicator: UIView {
    
    static var _maps:[UIView:UIColor] = [UIView:UIColor]()
    static var _new_backgroundColor:UIColor?
    
    static var _isPlay:Bool = false
    
    static func startAnimation(target:UIView, color:UIColor) {
        
        if(_maps[target] == nil) {
            _maps[target] = target.backgroundColor
        }
        
        _new_backgroundColor = color
        
        _isPlay = true
        
        UIView.animateWithDuration(1, delay: 0, options:.CurveEaseOut, animations: {
            
            target.backgroundColor = self._new_backgroundColor
            
            }, completion: {finished in
                
                if(self._isPlay) {
                    UIView.animateWithDuration(0.5, delay: 0, options:.CurveEaseOut, animations: {
                        
                        target.backgroundColor = self._maps[target]
                        
                        }, completion: {finished in
                            
                            if(self._isPlay) {
                                self.startAnimation(target, color: self._new_backgroundColor!)
                            }
                    })
                }
        })
    }
    
    static func stopAnimation(target:UIView) {
        
        _isPlay = false
        
        if self._maps[target] == nil {
            return
        }
        
        UIView.animateWithDuration(0.5, delay: 0, options:.CurveEaseOut, animations: {
            
            target.backgroundColor = self._maps[target]
            
            }, completion: {finished in
                //
        })
        
        self._maps[target] = nil
        _new_backgroundColor = nil
    }
}
