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
        if (result.value != nil) {
            do {
                print("response data: \(try result.value?.mapString() ?? "")")
            } catch {
                print("response data transform error")
            }
            
            let statusCode: Int = result.value!.statusCode
            return (statusCode == 200 || statusCode == 304) ? result : Result(error: MoyaError.statusCode(result.value!))
        }
        return result
    }
}
