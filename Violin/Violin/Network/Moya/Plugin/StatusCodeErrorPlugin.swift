//
//  状态码异常插件
//
//  Created by liuzhiyi on 2018/8/23.
//  Copyright © 2018年 Karma. All rights reserved.
//

import Moya
import Result

struct StatusCodeErrorPlugin: PluginType {
    
    func process(_ result: Result<Moya.Response, MoyaError>, target: TargetType) -> Result<Moya.Response, MoyaError> {
        let statusCode: Int = result.value!.statusCode
        return (statusCode == 200 || statusCode == 304) ? result : Result(error: MoyaError.statusCode(result.value!))
    }
}
