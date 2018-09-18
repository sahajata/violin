//
//  ViolinTableViewController.swift
//  Violin
//
//  Created by liuzhiyi on 2018/9/13.
//  Copyright © 2018年 Karma. All rights reserved.
//

import UIKit
import DZNEmptyDataSet
import MJRefresh
import ObjectMapper

open class ViolinTableViewController<Q: QueryParameter, R: ViolinModel>: UITableViewController, DZNEmptyDataSetSource, DZNEmptyDataSetDelegate, NetworkErrorDelegate {
    
    // 顶部刷新
    let header = MJRefreshNormalHeader()
    // 底部刷新
    let footer = MJRefreshAutoNormalFooter()
    
    // 查询参数
    open var queryParmeter: Q!
    
    // 查询结果
    open var dataSource: QueryResult<R>! {
        didSet {
            if (dataSource != nil && dataSource?.records != nil) {
                header.isHidden = false
                footer.isHidden = false
            } else {
                header.isHidden = true
                footer.isHidden = true
            }
            self.tableView.reloadData()
        }
    }
    
    open override func viewDidLoad() {
        super.viewDidLoad()
        
        // 设置下拉刷新
        header.setRefreshingTarget(self, refreshingAction: #selector(headerRefresh))
        self.tableView.mj_header = header
        
        // 设置上拉加载更多
        footer.setRefreshingTarget(self, refreshingAction: #selector(footerRefresh))
        self.tableView.mj_footer = footer
        
        // 设置空数据显示代理
        self.tableView.emptyDataSetSource = self
        self.tableView.emptyDataSetDelegate = self
        
    }
    
    open func loadData() {
        
    }
    
    @objc func headerRefresh() {
        print("下拉刷新")
        queryParmeter?.pageNo = 0
        loadData()
    }
    
    @objc func footerRefresh() {
        print("上拉加载更多")
        queryParmeter?.pageNo += 1
        loadData()
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
    
    // MARK: UITableViewController
    override open func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0.01
    }
    
    override open func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.01
    }
    
    override open func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource?.records?.count ?? 0
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
    
    // MARK: DZNEmptyDataSet
    public func title(forEmptyDataSet scrollView: UIScrollView!) -> NSAttributedString! {
        let text = "没有数据";
        return NSAttributedString(string: text, attributes: nil)
    }
    
    public func emptyDataSetShouldDisplay(_ scrollView: UIScrollView!) -> Bool {
        return true
    }
    
}
