//
//  BaseNetworkErrorHandler.swift
//  Violin
//
//  Created by liuzhiyi on 2018/9/10.
//  Copyright © 2018年 Karma. All rights reserved.
//

public protocol BaseNetworkErrorHandler {
    
    // 处理未授权异常
    func handleUnauthorize(_ callback : @escaping () -> ())
    
    // 处理服务器异常
    func handleServiceException()
    
    // 处理网络未连接异常
    func handleDisconnected()
    
    // 处理连接未找到或无法建立连接
    func handleNotFound()
    
    // 处理业务异常
    func handleBusinessExcepion(messages: Dictionary<String, String>)
    
    // 处理未知异常
    func handleUnknown()
    
    // 处理超时异常
    func handleTimeout()
    
}
