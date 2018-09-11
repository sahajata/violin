//
//  MineService.swift
//  ViolinTests
//
//  Created by liuzhiyi on 2018/9/10.
//  Copyright © 2018年 Karma. All rights reserved.
//

import Violin

public class MineService: NetworkErrorHandler, BaseService {
    
    public var serverUrl: String {return "http://192.168.1.152/lawyer/rpc/invoke"}
    
    public var beanId: String {return "mineController"}
}
