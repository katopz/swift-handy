//
//  KZLineIndicator.swift
//  EnvatoMiner
//
//  Created by Todsaporn Banjerdkit on 6/2/15.
//  Copyright (c) 2015 Debokeh. All rights reserved.
//

import UIKit

class KZLineIndicator: UIView {

    static var _maps:[UIView:UIView] = [UIView:UIView]()
    
    static func startAnimation(parentView:UIView) {
        
        if(_maps[parentView] == nil) {
            let _line = UIView(frame: CGRect(x: 0,y: 0,width: UIScreen.mainScreen().bounds.width, height: 2))
            _line.backgroundColor = GMColor.orange400Color()
            _maps[parentView] = _line
            parentView.addSubview(_line)
        }

        
        UIView.animateWithDuration(1, delay: 0, options:.CurveEaseOut, animations: {
            self._maps[parentView]!.alpha = 0
            }, completion: {finished in
                
                if(self._maps[parentView] != nil) {
                    UIView.animateWithDuration(0.5, delay: 0, options:.CurveEaseOut, animations: {
                        self._maps[parentView]!.alpha = 1
                        }, completion: {finished in
                            
                            if(self._maps[parentView] != nil) {
                                self.startAnimation(parentView)
                            }
                    })
                }
        })
    }
    
    static func stopAnimation(parentView:UIView) {
        _maps[parentView]?.removeFromSuperview()
        _maps[parentView] = nil
    }
}
