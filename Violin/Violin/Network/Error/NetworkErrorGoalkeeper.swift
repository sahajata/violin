//
//  网络异常守门员
//  Violin
//
//  Created by liuzhiyi on 2018/9/10.
//  Copyright © 2018年 Karma. All rights reserved.
//

import Moya
import SwiftyJSON

public class NetworkErrorGoalkeeper {
    
    //分析网络异常
    public static func profiling(_ error: Error) throws {
        if (!NetUtil.isConnected()) {
            throw NetworkError.DISCONNECTED // 网络未连接
        }
        
        if (error is MoyaError) {
            let moyaError: MoyaError = error as! MoyaError
            switch moyaError {
            case .statusCode:
                let response: Response = moyaError.response!
                let statusCode: Int = response.statusCode
                switch statusCode {
                case 401: // 授权异常
                    throw NetworkError.UNAUTHORIZE
                case 404: // 连接未找到或无法建立连接
                    throw NetworkError.NOT_FOUND
                case 409: // 业务异常
                    var businessException = [String : String]()
                    let json = JSON(response.data)
                    for (_, value) in json["errors"] {
                        let errors: [String: JSON] = value.dictionary!
                        businessException[(errors["code"]?.string)!] = errors["message"]?.string
                    }
                    throw NetworkError.BUSINESS_EXCEPTION(businessException)
                case 500...600: // 服务器内部异常
                    throw NetworkError.SERVER_EXCEPTION
                default:
                    throw NetworkError.UNKNOWN // 未知异常
                }
            case .underlying:
                throw NetworkError.TIMEOUT // 超时
            default:
                throw NetworkError.UNKNOWN // 未知异常
            }
            
            
        }
        throw NetworkError.UNKNOWN // 未知异常
    }
}
