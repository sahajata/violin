//
//  自定义网络异常
//
//  Created by liuzhiyi on 2018/8/22.
//  Copyright © 2018年 Karma. All rights reserved.
//
import Foundation

public enum NetworkError: Error {
    case UNAUTHORIZE // 未授权
    case SERVER_EXCEPTION // 服务器异常
    case DISCONNECTED // 网络未连接
    case NOT_FOUND // 连接未找到或无法建立连接
    case BUSINESS_EXCEPTION(Dictionary<String, String>) // 业务异常
    case UNKNOWN // 未知
}

