//
//  ViewController.swift
//  3DTouchButton+GestureRecognizer
//
//  Created by Neo on 15/11/8.
//  Copyright © 2015年 KuBao. All rights reserved.
//

import UIKit
class ViewController: UIViewController {

    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var customView: CustomView!
    @IBOutlet weak var forceButton: ForceButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        let gestureRecognizer = ForceGestureRecognizer()
        gestureRecognizer.addForceCallBack { (state, force, gestureReconginzer) -> Void in
            
            print(NSStringFromCGSize(self.customView.frame.size))
            if state == UIGestureRecognizerState.Changed{
                if self.customView.frame.size.width > UIScreen.mainScreen().bounds.size.width{
                    return
                }
            }
           
            self.customView.layer.transform = CATransform3DMakeScale(1+force/6, 1+force/6, 1)
            
        };
        forceButton.addForceCallBack { (state, force, sender) -> Void in
            print(force)
            if state == ForceButtonState.Began{
                sender.layer.transform = CATransform3DMakeScale(1, 1, 1)
            }
            sender.layer.transform = CATransform3DMakeScale(1+force/6, 1+force/6, 1)

        }
        image.addGestureRecognizer(gestureRecognizer)
        // Do any additional setup after loading the view, typically from a nib.
       
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

