//
//  ViolinServiceManager.swift
//  Violin
//
//  Created by liuzhiyi on 2018/9/14.
//  Copyright © 2018年 Karma. All rights reserved.
//

public class ViolinServiceManager {
    
    public static func create<S: ViolinService, D: NetworkErrorDelegate>(type: S.Type, delegate: D) -> S {
        let service: S = S()
        service.delegate = delegate
        return service
    }

}
