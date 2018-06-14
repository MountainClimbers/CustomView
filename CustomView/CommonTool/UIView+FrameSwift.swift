//
//  UIView+FrameSwift.swift
//  UPMApp
//
//  Created by qj.huang on 2018/6/14.
//

import Foundation
import UIKit

extension UIView {
    var left : CGFloat {
        get{
            return self.frame.origin.x
        }
        set(left) {
            self.frame.origin = CGPoint.init(x: left, y: self.frame.origin.y)
        }
    }

    var right : CGFloat {
        get{
            return self.frame.origin.x + self.frame.size.width
        }
        set(right) {
            self.frame.origin = CGPoint.init(x: right - self.frame.size.width, y: self.frame.origin.y)
        }
    }


    var width : CGFloat {
        get{
            return self.frame.size.width
        }
        set(width) {
            self.frame.size = CGSize(width: width, height: self.frame.height)
        }
    }

    var top: CGFloat {
        get{
            return self.frame.origin.y
        }
        set(top){
            self.frame.origin = CGPoint.init(x: self.frame.origin.x, y: top)
        }
    }
    
    var bottom: CGFloat {
        get{
            return self.frame.origin.y + self.frame.size.height
        }
        set(bottom){
            self.frame.origin = CGPoint.init(x: self.frame.origin.x, y: bottom + self.frame.size.height)
        }
    }
    
    var height : CGFloat {
        get{
            return self.frame.size.height
        }
        set(height) {
            self.frame.size = CGSize(width: self.frame.width, height: height)
        }
    }

    var size : CGSize {
        get{
            return self.frame.size
        }
        set(size) {
            self.frame.size = size
        }
    }
    
    var centerX : CGFloat {
        get{
            return self.center.x
        }
        set(centerX) {
            self.center = CGPoint.init(x: centerX, y: self.center.y)
        }
    }

    var centerY : CGFloat {
        get{
            return self.center.y
        }
        set(centerY) {
            
            self.center = CGPoint.init(x: self.center.x, y: centerY)
        }
    }
  
}
