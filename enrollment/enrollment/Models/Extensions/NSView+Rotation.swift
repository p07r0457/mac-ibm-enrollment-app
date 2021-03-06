//
//  NSView+Rotation.swift
//  enrollment
//
//  Created by Jay Latman on 9/2/18.
//  Copyright © 2018 IBM. All rights reserved.
//  SPDX-License-Identifier: GPL-3.0-only
//

import AppKit

extension NSView {
    private static let kRotationAnimationKey = "rotationanimationkey"
    
    /**
     Extension method for locating the anchor point of a NSView to allow for proper rotation
     
     - Parameter indicator : `CircularStatus` indicator
    */
    func determineAnchorPoint(indicator: CircularStatus) {
        indicator.layer?.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        let frame : CGRect = (indicator.layer?.frame)!
        let xCoord = Float(frame.origin.x + frame.size.width)
        let yCoord = Float(frame.origin.y + frame.size.height)
        let myPoint = CGPoint(x: CGFloat(xCoord), y: CGFloat(yCoord))
        indicator.layer?.position = myPoint
    }
    
    /**
     Extension method for rotating a NSView over a period of time
     
     - Parameter duration : Double value representing the seconds of rotation
    */
    func rotate(duration: Double = 1.0) {
        if layer?.animation(forKey: NSView.kRotationAnimationKey) == nil {
            let rotationAnimation = CABasicAnimation(keyPath: "transform.rotation")
            
            rotationAnimation.fromValue = 0.0
            rotationAnimation.toValue = Float.pi * -2.0
            rotationAnimation.duration = duration
            rotationAnimation.repeatCount = Float.infinity
            
            layer?.add(rotationAnimation, forKey: NSView.kRotationAnimationKey)
        }
    }
    
    /**
     Extension method for stopping the rotation animation of a NSView
    */
    func stopRotation() {
        if layer?.animation(forKey: NSView.kRotationAnimationKey) != nil {
            layer?.removeAnimation(forKey: NSView.kRotationAnimationKey)
        }
    }
}
