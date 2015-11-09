//
//  ForceButton.swift
//  3DTouchButton+GestureRecognizer
//
//  Created by Neo on 15/11/8.
//  Copyright © 2015年 KuBao. All rights reserved.
//

import UIKit
enum ForceButtonState: Int {
    case Began = 0
    case Moved = 1
    case Ended = 2
}
class ForceButton: UIButton {
    private var forceTouchCallBack:((state:ForceButtonState,force:CGFloat,sender:UIButton)->Void)?;
    public func addForceCallBack(callBack:(state:ForceButtonState,force:CGFloat,sender:UIButton)->Void){
        self.forceTouchCallBack = callBack;
    }
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        super.touchesBegan(touches, withEvent: event)
        guard let touch = touches.first else{
            return
        }
        if let callback = forceTouchCallBack{
            callback(state: ForceButtonState.Began,force: touch.force,sender:self);
            
        }
    }
    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
        super.touchesMoved(touches, withEvent: event)
        guard let touch = touches.first else{
            return
        }
        if let callback = forceTouchCallBack{
            callback(state: ForceButtonState.Moved,force: touch.force,sender:self);
        }
    }
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        super.touchesEnded(touches, withEvent: event)
        guard let touch = touches.first else{
            return
        }
        if let callback = forceTouchCallBack{
            callback(state: ForceButtonState.Ended,force: touch.force,sender:self);
        }
    }
   
}
