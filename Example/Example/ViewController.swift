//
//  ViewController.swift
//  Example
//
//  Created by liuzhiyi on 2018/9/13.
//  Copyright © 2018年 Karma. All rights reserved.
//

import UIKit
import Violin

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let mineService: MineService = MineService()
        mineService.delegate = DefaultNetworkErrorDelegate()
        mineService.request(methed: "perfectPassword", succeed: {(result: Bool) in
            debugPrint(result)
        }, failure: {(error: NetworkError) in
            print("failurefailurefailurefailurefailurefailurefailurefailure")
        })
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

