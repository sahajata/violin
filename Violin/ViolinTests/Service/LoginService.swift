//
//  ViolinService.swift
//  ViolinTests
//
//  Created by liuzhiyi on 2018/9/7.
//  Copyright © 2018年 Karma. All rights reserved.
//

import Foundation
import Violin

public class LoginService: BaseService {
    
    public var serverUrl: String {return "http://192.168.10.86:8080/lawyer/rpc/invoke"}
    
    public var beanId: String {return "loginController"}
    
    
}
