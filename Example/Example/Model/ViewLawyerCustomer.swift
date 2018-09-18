//
//  ViewLawyerCustomer.swift
//  Example
//
//  Created by liuzhiyi on 2018/9/17.
//  Copyright © 2018年 Karma. All rights reserved.
//

import Violin
import ObjectMapper

public struct ViewLawyerCustomer: ViolinModel {
    
    public var id: Int?
    public var customerMobilePhone: String?
    public var remark: String?
    public var remarkMobilePhone: String?
    public var customer: ViewCustomer?
    
    public init() { }
    
    public init?(map: Map) { }
    
    mutating public func mapping(map: Map) {
        id <- map["id"]
        customerMobilePhone <- map["customerMobilePhone"]
        remark <- map["remark"]
        remarkMobilePhone <- map["remarkMobilePhone"]
        customer <- map["customer"]
    }
}
