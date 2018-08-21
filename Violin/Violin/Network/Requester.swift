//
//  Request.swift
//  Violin
//
//  Created by liuzhiyi on 2018/8/21.
//  Copyright © 2018年 Karma. All rights reserved.
//

import Foundation
import Alamofire

public class Requester : NSObject {
    
    public func request() {
        Alamofire.request("http://www.zhaowonet.com/lawyer/rpc/invoke/versionController/getBuild").response { response in
            debugPrint(response)
        }
    }
}
