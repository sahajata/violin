//
//  HeaderPlugin.swift
//  Violin
//
//  Created by liuzhiyi on 2018/9/19.
//  Copyright © 2018年 Karma. All rights reserved.
//

import Moya
import Result

struct HeaderPlugin: PluginType {
    
    func prepare(_ request: URLRequest, target: TargetType) -> URLRequest {
        var mRequest = request
        return mRequest
    }
}
