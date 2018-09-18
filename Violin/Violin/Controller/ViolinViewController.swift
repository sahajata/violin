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
    }
    
    open func handleTimeout() {
    }
    
    open func handleUnknown() {
        
    }
}

extension ViolinViewController {
    public func toast(_ text: String){
        let hud = MBProgressHUD.showAdded(to: UIApplication.shared.keyWindow!, animated: true)
        hud.mode = .text
        hud.label.text = text
        hud.label.numberOfLines = 5
        hud.hide(animated: true, afterDelay: 2.0)
    }
}

// MARK: DZNEmptyDataSet
extension ViolinViewController: DZNEmptyDataSetSource, DZNEmptyDataSetDelegate {
    
}
