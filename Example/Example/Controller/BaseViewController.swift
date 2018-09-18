//
//  BaseViewController.swift
//  Example
//
//  Created by liuzhiyi on 2018/9/17.
//  Copyright © 2018年 Karma. All rights reserved.
//

import UIKit
import Violin

class BaseViewController: ViolinViewController {
    
    override func handleUnauthorize(_ callback: @escaping () -> ()) {
        System.autoLogin(callback)
    }
}
