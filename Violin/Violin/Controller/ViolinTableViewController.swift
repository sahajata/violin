//
//  ViolinTableViewController.swift
//  Violin
//
//  Created by liuzhiyi on 2018/9/13.
//  Copyright © 2018年 Karma. All rights reserved.
//

import UIKit

public class BaseTableViewController: UITableViewController, NetworkErrorDelegate {
    
    public func handleUnauthorize(_ callback: @escaping () -> ()) {
    }
    
    public func handleServiceException() {
    }
    
    public func handleDisconnected() {
    }
    
    public func handleNotFound() {
    }
    
    public func handleBusinessExcepion(messages: Dictionary<String, String>) {
    }
    
    public func handleTimeout() {
    }
    
    public func handleUnknown() {
    }
    

}

