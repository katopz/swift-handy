//
//  UIWebView+KZ.swift
//  arn
//
//  Created by Pi R Square on 7/17/2558 BE.
//  Copyright © 2558 pirsquare. All rights reserved.
//

import Foundation

extension UIWebView {
    
    public var selectedString:String {
        get {
            return self.stringByEvaluatingJavaScriptFromString("window.getSelection().toString()") ?? ""
        }
    }
    
    public var contentOffset:CGPoint {
       get {    
    /* Fetch the current selection and its pixel location */
    let positionString = self.stringByEvaluatingJavaScriptFromString("(function () {\n"
    // Fetch the selection
    + "var sel = window.getSelection();"
    + "var node = sel.anchorNode;"
    
    // Insert a dummy node that we'll use to find the selection position
    + "var range = sel.getRangeAt(0);"
    + "var dummyNode = document.createElement(\"span\");"
    + "range.insertNode(dummyNode);"
    
    // Define the functions we'll use to calculate the dummy node's position
    + "function Point(x, y) {"
    + "this.x = x;"
    + "this.y = y;"
    + "}"
    
    + "function getPoint (o) {"
    + "var oX = 0;"
    + "var oY = 0;"
    + "if (o.offsetParent) {"
    + "do {"
    + "oX += o.offsetLeft;"
    + "oY += o.offsetTop;"
    + "o=o.offsetParent;"
    + "} while (o)"
    + "} else if (o.x) {"
    + "oX += o.x;"
    + "oY += o.y;"
    + "}"
    + "return new Point(oX, oY);"
    + "}"
    
    // Get the dummy node's position and drop the node
    + "var p = getPoint(dummyNode);"
    + "dummyNode.parentNode.removeChild(dummyNode);"
    
    // Offset for the current window offset.
    + "p.x -= window.pageXOffset;"
    + "p.y -= window.pageYOffset;"
    
    // TODO - determine the text line height and offset the arrow accordingly?
    
    // Return the coordinates as a CGPointFromString() compatible {x, y} string
    + "return \"{\" + p.x + \", \" + p.y + \"}\";"
    + "})();")
    var position = CGPointFromString(positionString!)
    position = self.convertPoint(position, fromView: self)
    
    return position
    }
    }
}