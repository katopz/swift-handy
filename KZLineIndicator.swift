//
//  KZLineIndicator.swift
//  EnvatoMiner
//
//  Created by Todsaporn Banjerdkit on 6/2/15.
//  Copyright (c) 2015 Debokeh. All rights reserved.
//

import UIKit

class KZLineIndicator: UIView {

    static var _line:UIView?
    static var _isPlay:Bool = false
    
    static var line:UIView {
        get {
            if _line == nil {
                _line = UIView(frame: CGRect(x: 0,y: 0,width: UIScreen.mainScreen().bounds.width, height: 2))
                _line!.backgroundColor = GMColor.orange400Color()
            }
            
            return _line!
        }
    }
    
    static func startAnimation() {
        
        _isPlay = true
        
        UIView.animateWithDuration(1, delay: 0, options:.CurveEaseOut, animations: {
            self.line.alpha = 0
            }, completion: {finished in
                
                if(self._isPlay) {
                    UIView.animateWithDuration(0.5, delay: 0, options:.CurveEaseOut, animations: {
                        self.line.alpha = 1
                        }, completion: {finished in
                            
                            if(self._isPlay) {
                                self.startAnimation()
                            }
                    })
                }
        })
    }
    
    static func stopAnimation() {
        _isPlay = false
        self.line.alpha = 0
    }
}
