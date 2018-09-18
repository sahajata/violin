//
//  LawyerCustomerParameter.swift
//  Example
//
//  Created by liuzhiyi on 2018/9/17.
//  Copyright © 2018年 Karma. All rights reserved.
//

import Violin
import ObjectMapper

public class LawyerCustomerParameter: QueryParameter {
    public var keyword: String?
    
    public override func mapping(map: Map) {
        super.mapping(map: map)
        keyword <- map["keyword"]
    }
}
