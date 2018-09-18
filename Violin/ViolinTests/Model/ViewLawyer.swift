//
//  ViewLawyer.swift
//  ViolinTests
//
//  Created by liuzhiyi on 2018/8/30.
//  Copyright © 2018年 Karma. All rights reserved.
//

import Violin
import ObjectMapper

public struct ViewLawyer: ViolinModel {
    
    public var id: Int?
    public var mobilePhone: String?
    public var realname: String?
    
    public init() { }
    public init?(map: Map) { }
    
    mutating public func mapping(map: Map) {
        id <- map["id"]
        mobilePhone <- map["mobilePhone"]
        realname <- map["realname"]
    }
}
