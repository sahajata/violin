//
//  简单的TableViewController（多用于静态TableView布局）
//  Violin
//
//  Created by liuzhiyi on 2018/9/18.
//  Copyright © 2018年 Karma. All rights reserved.
//

import UIKit

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
    }
    
    open func handleTimeout() {
        self.emptyDataTitle = "连接超时"
    }
    
    open func handleUnknown() {
        self.emptyDataTitle = "未知异常"
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

