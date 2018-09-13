//
//  NetworkErrorHandler.swift
//  ViolinTests
//
//  Created by liuzhiyi on 2018/9/10.
//  Copyright © 2018年 Karma. All rights reserved.
//

import Violin

public class NetworkErrorHandler : NetworkErrorDelegate {
    
    public func handleUnauthorize(_ callback : @escaping () -> ()) {
        print("handleUnauthorize")
        System.autoLogin(callback)
    }
    
    public func handleServiceException() {
        print("handleServiceException")
    }
    
    public func handleDisconnected() {
        print("handleDisconnected")
    }
    
    public func handleNotFound() {
        print("handleNotFound")
    }
    
    public func handleBusinessExcepion(messages: Dictionary<String, String>) {
        print("handleBusinessExcepion")
    }
    
    public func handleUnknown() {
        print("handleUnknown")
    }
    
    public func handleTimeout() {
        print("handleTimeout")
    }
}
