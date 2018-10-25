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

open class ViolinTableViewController<Q: QueryParameter, R: ViolinModel>: ViolinSimpleTableViewController, DZNEmptyDataSetSource, DZNEmptyDataSetDelegate {
    
    // 顶部刷新
    let header = MJRefreshNormalHeader()
    // 底部刷新
    let footer = MJRefreshAutoNormalFooter()
    
    private var queryParmeter: Q!
    
    // 查询参数
    open func getQueryParmeter() -> Q {
        if (queryParmeter == nil) {
            queryParmeter = Q()
        }
        return queryParmeter
    }
    
    // 查询结果
    open var dataSource: QueryResult<R> = QueryResult<R>()
    
    open func setDataSource(dataSource: QueryResult<R>) {
        header.endRefreshing()
        self.dataSource.paging = dataSource.paging
        self.dataSource.records += dataSource.records
        let isNotEmpty: Bool = dataSource.records.count > 0
        header.isHidden = !isNotEmpty
        footer.isHidden = !isNotEmpty
            
        if (isNotEmpty && (dataSource.paging?.morePage)!) {
            footer.resetNoMoreData()
            footer.endRefreshing()
        } else {
            footer.endRefreshingWithNoMoreData()
        }
        self.tableView.reloadData()
    }
    
    open func setEmptyDataSource() {
        self.dataSource.paging = Paging()
        self.dataSource.records = []
        header.isHidden = true
        footer.isHidden = true
        footer.resetNoMoreData()
        footer.endRefreshing()
        self.tableView.reloadData()
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
        dataSource = QueryResult<R>()
        getQueryParmeter().pageNo = 1
        loadData()
    }
    
    @objc func footerRefresh() {
        getQueryParmeter().pageNo += 1
        loadData()
    }
    
    open override func handleServiceException() {
        super.handleServiceException()
        setEmptyDataSource()
    }
    
    open override func handleDisconnected() {
        super.handleServiceException()
        setEmptyDataSource()
    }
    
    open override func handleNotFound() {
        super.handleServiceException()
        setEmptyDataSource()
    }
    
    open override func handleTimeout() {
        super.handleServiceException()
        setEmptyDataSource()
    }
    
    open override func handleUnknown() {
        super.handleServiceException()
        setEmptyDataSource()
    }
    
    // MARK: DZNEmptyDataSet
    open override func title(forEmptyDataSet scrollView: UIScrollView!) -> NSAttributedString! {
        return super.title(forEmptyDataSet: scrollView)
    }
    open override func buttonTitle(forEmptyDataSet scrollView: UIScrollView!, for state: UIControl.State) -> NSAttributedString! {
        return super.buttonTitle(forEmptyDataSet: scrollView, for: state)
    }
    
    open override func emptyDataSetShouldDisplay(_ scrollView: UIScrollView!) -> Bool {
        return super.emptyDataSetShouldDisplay(scrollView)
    }
    
    open func emptyDataSet(_ scrollView: UIScrollView!, didTap button: UIButton!) {
        headerRefresh()
    }
}
