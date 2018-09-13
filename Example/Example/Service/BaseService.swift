//
//  BaseService.swift
//  ViolinTests
//
//  Created by liuzhiyi on 2018/9/13.
//  Copyright © 2018年 Karma. All rights reserved.
//

import Violin

public class BaseService: ViolinService {
    
    override public var serverUrl: String {return "http://192.168.1.152/lawyer/rpc/invoke"}
    
}
