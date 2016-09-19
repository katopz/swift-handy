//
//  KZLineIndicator.swift
//  swift-handy
//
//  Created by katopz on 6/2/15.
//  Copyright (c) 2015 Debokeh. All rights reserved.
//

import UIKit

class KZLineIndicator: UIView {

    static var _maps:[UIView:UIView] = [UIView:UIView]()
    
    static func startAnimation(_ parentView:UIView) {
        
        if(_maps[parentView] == nil) {
            let _line = UIView(frame: CGRect(x: 0,y: 0,width: UIScreen.main.bounds.width, height: 2))
            _line.backgroundColor = GMColor.orange400Color()
            _maps[parentView] = _line
            parentView.addSubview(_line)
        }

        
        UIView.animate(withDuration: 1, delay: 0, options:.curveEaseOut, animations: {
            self._maps[parentView]!.alpha = 0
            }, completion: {finished in
                
                if(self._maps[parentView] != nil) {
                    UIView.animate(withDuration: 0.5, delay: 0, options:.curveEaseOut, animations: {
                        self._maps[parentView]!.alpha = 1
                        }, completion: {finished in
                            
                            if(self._maps[parentView] != nil) {
                                self.startAnimation(parentView)
                            }
                    })
                }
        })
    }
    
    static func stopAnimation(_ parentView:UIView) {
        _maps[parentView]?.removeFromSuperview()
        _maps[parentView] = nil
    }
}
