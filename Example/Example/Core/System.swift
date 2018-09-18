//
//  System.swift
//  ViolinTests
//
//  Created by liuzhiyi on 2018/9/10.
//  Copyright © 2018年 Karma. All rights reserved.
//

import Violin

public class System {
    
    public static func autoLogin(_ callback : @escaping () -> ()) {
        let loginService: LoginService = LoginService()
        
        // TODO: 此处的登录信息需要从本地缓存内拿到
        loginService.request(methed: "login", parameters: "18575626156", "274d65c00e145da5fc96afcf50b72bf3", "123456", "wefwefweew", succeed: {(response: ViewLawyer) in
            callback()
        }, failure: {(error: NetworkError) in
            
        })
    }
}
