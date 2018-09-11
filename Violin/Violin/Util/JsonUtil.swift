//
//  JsonUtil.swift
//  Violin
//
//  Created by liuzhiyi on 2018/9/7.
//  Copyright © 2018年 Karma. All rights reserved.
//

import Foundation
import SwiftyJSON

public class JsonUtil {
    
    public static func toJson(_ object: Any) -> String {
        let json = JSON(object)
        return json.rawString()!
    }
}
