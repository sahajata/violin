//
//  BaseTableViewController.swift
//  Example
//
//  Created by liuzhiyi on 2018/9/17.
//  Copyright © 2018年 Karma. All rights reserved.
//

import UIKit
import Violin
import ObjectMapper

class BaseTableViewController<Q: QueryParameter, R: ViolinModel>: ViolinTableViewController<Q, R> {
    
    override func handleUnauthorize(_ callback: @escaping () -> ()) {
        System.autoLogin(callback)
    }
}
