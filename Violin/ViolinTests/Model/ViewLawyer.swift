//
//  Human.swift
//  ViolinTests
//
//  Created by liuzhiyi on 2018/8/30.
//  Copyright © 2018年 Karma. All rights reserved.
//

import ObjectMapper

public struct Human: Mappable {
    
    public var name: String?
    public var age: Int?
    
    public init?(map: Map) {
        self.name <- map["name"]
        self.age <- map["age"]
    }
    
    mutating public func mapping(map: Map) {
        self.name <- map["name"]
        self.age <- map["age"]
    }
}
