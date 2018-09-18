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
        
//        self.queryParmeter.keyword = "刘"
        loadData()
    }
    
    override func loadData() {
        self.queryParmeter = LawyerCustomerParameter()
        mineService.request(methed: "customers", parameters: LawyerCustomerParameter(), succeed: {(result: QueryResult<ViewLawyerCustomer>) in
            self.dataSource = QueryResult<ViewLawyerCustomer>()
        }, failure: {(error: NetworkError) in
            print("failure")
        })
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SecondCell") as! SecondCell
        cell.model = dataSource?.records![indexPath.row]
        return cell
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
