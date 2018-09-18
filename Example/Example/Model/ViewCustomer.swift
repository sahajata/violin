//
//  ViewCustomer.swift
//  Example
//
//  Created by liuzhiyi on 2018/9/17.
//  Copyright © 2018年 Karma. All rights reserved.
//

import Violin
import ObjectMapper

public struct ViewCustomer: ViolinModel {
    
    public var id: Int?
    public var nickname: String?
    public var mobilePhone: String?
    public var imageUrl: String?
    
    public init() { }
    
    public init?(map: Map) { }
    
    mutating public func mapping(map: Map) {
        id <- map["id"]
        nickname <- map["nickname"]
        mobilePhone <- map["mobilePhone"]
        imageUrl <- map["imageUrl"]
    }
}
