//
//  CustomView.swift
//  3DTouchButton+GestureRecognizer
//
//  Created by Neo on 15/11/9.
//  Copyright © 2015年 KuBao. All rights reserved.
//

import UIKit
@IBDesignable
class CustomView: UIView {
    @IBOutlet var image:UIImage!
    @IBInspectable var cornerRadius:CGFloat = 0.0{
        didSet{
            let mask = CAShapeLayer();
            mask.path = UIBezierPath(roundedRect: self.layer.bounds, byRoundingCorners: UIRectCorner.AllCorners, cornerRadii: CGSizeMake(cornerRadius, cornerRadius)).CGPath
            self.layer.mask = mask;
            //self.layer.masksToBounds = true
            self.clipsToBounds = true
        }
    }
    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */

}
