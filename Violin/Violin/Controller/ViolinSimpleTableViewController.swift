//
//  简单的TableViewController（多用于静态TableView布局）
//  Violin
//
//  Created by liuzhiyi on 2018/9/18.
//  Copyright © 2018年 Karma. All rights reserved.
//

import UIKit

open class ViolinSimpleTableViewController: UITableViewController, UIGestureRecognizerDelegate, NetworkErrorDelegate {
    
    // MARK: NetworkErrorDelegate
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

