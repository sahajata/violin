//
//  简单的TableViewController（多用于静态TableView布局）
//  Violin
//
//  Created by liuzhiyi on 2018/9/18.
//  Copyright © 2018年 Karma. All rights reserved.
//

import UIKit
import MBProgressHUD

open class ViolinSimpleTableViewController: UITableViewController, UIGestureRecognizerDelegate, NetworkErrorDelegate {
    
    open var emptyDataTitle = "没有数据"
    
    open var emptyDataButtonTitle = "重新加载"
    
    open var emptyDataImage = UIImage()
    
    // MARK: NetworkErrorDelegate
    open func handleUnauthorize(_ callback: @escaping () -> ()) {
    }
    
    open func handleServiceException() {
        self.emptyDataTitle = "服务器异常"
    }
    
    open func handleDisconnected() {
        self.emptyDataTitle = "网络未连接"
    }
    
    open func handleNotFound() {
        self.emptyDataTitle = "网络未连接"
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
        self.emptyDataTitle = "连接超时"
    }
    
    open func handleUnknown() {
        self.emptyDataTitle = "未知异常"
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
    
    open func toast(_ text: String){
        let hud = MBProgressHUD.showAdded(to: UIApplication.shared.keyWindow!, animated: true)
        hud.mode = .text
        hud.label.text = text
        hud.label.numberOfLines = 5
        hud.hide(animated: true, afterDelay: 2.0)
    }
    
    // MARK: DZNEmptyDataSet
    open func title(forEmptyDataSet scrollView: UIScrollView!) -> NSAttributedString! {
        return NSAttributedString(string: self.emptyDataTitle, attributes: nil)
    }
    open func buttonTitle(forEmptyDataSet scrollView: UIScrollView!, for state: UIControl.State) -> NSAttributedString! {
        return NSAttributedString(string: self.emptyDataButtonTitle, attributes: nil)
    }
    
    open func emptyDataSetShouldDisplay(_ scrollView: UIScrollView!) -> Bool {
        return true
    }
    
    open  func image(forEmptyDataSet scrollView: UIScrollView!) -> UIImage! {
        return self.emptyDataImage
    }
    
    open func emptyDataSetShouldAnimateImageView(_ scrollView: UIScrollView!) -> Bool {
        return true
    }
    
    
}

