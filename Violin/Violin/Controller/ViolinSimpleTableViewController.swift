//
//  简单的TableViewController（多用于静态TableView布局）
//  Violin
//
//  Created by liuzhiyi on 2018/9/18.
//  Copyright © 2018年 Karma. All rights reserved.
//

import UIKit

open class ViolinSimpleTableViewController: UITableViewController, UIGestureRecognizerDelegate, NetworkErrorDelegate {
    
    // MARK: UITableViewController
    override open func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0.01
    }
    
    override open func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.01
    }
    
    override open func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    override open func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override open func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    override open func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
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

