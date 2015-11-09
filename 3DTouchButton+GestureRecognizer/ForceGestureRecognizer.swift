//
//  ForceGestureRecognizer.swift
//  3DTouchButton+GestureRecognizer
//
//  Created by Neo on 15/11/8.
//  Copyright © 2015年 KuBao. All rights reserved.
//

import UIKit.UIGestureRecognizerSubclass

class ForceGestureRecognizer: UIGestureRecognizer {
    var forceValue:CGFloat = 0
    private var forceTouchCallBack:((state:UIGestureRecognizerState,force:CGFloat,gestureReconginzer:UIGestureRecognizer)->Void)?;
    public func addForceCallBack(callBack:(state:UIGestureRecognizerState,force:CGFloat,gestureReconginzer: UIGestureRecognizer)->Void){
        self.forceTouchCallBack = callBack;
    }
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent) {
        super.touchesBegan(touches, withEvent: event)
        guard let touch = touches.first else{
            return
        }
        if let callback = forceTouchCallBack{
            callback(state: UIGestureRecognizerState.Began,force: touch.force,gestureReconginzer: self);
            
        }
    }
    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent) {
        super.touchesMoved(touches, withEvent: event)
        guard let touch = touches.first else{
            return
        }
        if let callback = forceTouchCallBack{
            callback(state: UIGestureRecognizerState.Changed,force: touch.force,gestureReconginzer: self);
        }
    }
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent) {
        super.touchesEnded(touches, withEvent: event)
        guard let touch = touches.first else{
            return
        }
        if let callback = forceTouchCallBack{
            callback(state: UIGestureRecognizerState.Ended,force: touch.force,gestureReconginzer: self);
        }
    }

}
