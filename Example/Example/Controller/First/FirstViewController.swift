//
//  FirstViewController.swift
//  Example
//
//  Created by liuzhiyi on 2018/9/13.
//  Copyright © 2018年 Karma. All rights reserved.
//

import UIKit
import Violin

class FirstViewController: BaseViewController {
    
//    var mineService: MineService!
    var ruleService: RuleService!
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        mineService = ViolinServiceManager.create(type: MineService.self, delegate: self)
//        mineService.request(methed: "getDetail", succeed: {(lawyer: ViewLawyer) in
//            self.toast("当前登录账号的姓名是：\(lawyer.realname!)")
//        }, failure: {(error: NetworkError) in
//            print("failure")
//        })
        ruleService = ViolinServiceManager.create(type: RuleService.self, delegate: self)
        ruleService.request(methed: "getRule", succeed: {(result: Dictionary<String, Any>) in
            print(result["consultServiceCharge"] as! Int)
        }, failure: {(error: NetworkError) in
            print("failure")
        })
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}

