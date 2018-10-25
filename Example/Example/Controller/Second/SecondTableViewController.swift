//
//  TableViewController.swift
//  Example
//
//  Created by liuzhiyi on 2018/9/14.
//  Copyright © 2018年 Karma. All rights reserved.
//

import UIKit
import Violin

class SecondTableViewController: BaseTableViewController<LawyerCustomerParameter, ViewLawyerCustomer> {
    
    var mineService: MineService!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mineService = ViolinServiceManager.create(type: MineService.self, delegate: self)
        loadData()
    }
    
    override func loadData() {
        getQueryParmeter().addOrder(name: "test", desc: false)
        mineService.request(methed: "customers", parameters: getQueryParmeter(), succeed: {(result: QueryResult<ViewLawyerCustomer>) in
            self.setDataSource(dataSource: result)
        }, failure: {(error: NetworkError) in
            print("failure")
        })
    }

    // MARK: UITableViewController
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SecondCell") as! SecondCell
        cell.model = dataSource.records[indexPath.row]
        return cell
    }
    
    override open func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.records.count
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
