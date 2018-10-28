//
//  ViolinViewController.swift
//  Violin
//
//  Created by liuzhiyi on 2018/9/13.
//  Copyright © 2018年 Karma. All rights reserved.
//

import UIKit
import DZNEmptyDataSet
import MBProgressHUD

open class ViolinViewController: UIViewController, UIGestureRecognizerDelegate, NetworkErrorDelegate {
    
    open override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    open func handleUnauthorize(_ callback: @escaping () -> ()) {
    }
    
    open func handleServiceException() {
    }
    
    open func handleDisconnected() {
    }
    
    open func handleNotFound() {
    }
    
    open func handleBusinessExcepion(messages: Dictionary<String, String>) {
        var message: String = String.EMPTY
        for (key, value) in messages {
            message += value
            if (messages.count > 1) {
                message += String.ENTER
            }
        }
        toast(message)
    }
    
    open func handleTimeout() {
    }
    
    open func handleUnknown() {
        
    }
    
    open func beginLoading() -> MBProgressHUD {
        let hud = MBProgressHUD.showAdded(to: self.view, animated: true)
        hud.mode = .indeterminate
        hud.show(animated: true)
        return hud
    }
    
    open func endLoading(hud: MBProgressHUD) {
        hud.hide(animated: true)
    }
    
    open func toast(_ text: String) {
        let hud = MBProgressHUD.showAdded(to: UIApplication.shared.keyWindow!, animated: true)
        hud.mode = .text
        hud.label.text = text
        hud.label.numberOfLines = 5
        hud.hide(animated: true, afterDelay: 2.0)
    }
}
