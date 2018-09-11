//
//  TimeoutPlugin.swift
//  Violin
//
//  Created by liuzhiyi on 2018/9/10.
//  Copyright © 2018年 Karma. All rights reserved.
//

import Moya
import Result

struct TimeoutPlugin: PluginType {
    
    func prepare(_ request: URLRequest, target: TargetType) -> URLRequest {
        var mRequest = request
        mRequest.timeoutInterval = 10
        return mRequest
    }
}
