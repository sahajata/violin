//
//  FieldOrder.swift
//  Violin
//
//  Created by liuzhiyi on 2018/9/10.
//  Copyright © 2018年 Karma. All rights reserved.
//

import ObjectMapper

public class FieldOrder: ViolinModel {
    
    public required init() {
    }
    
    public required init(name: String, desc: Bool) {
        self.name = name
        self.desc = desc
    }
    
    public required init?(map: Map) { }
    
    // 排序字段名称
    var name: String?
    
    // 降序true、升序false
    var desc: Bool?
    
    public func mapping(map: Map) {
        name <- map["name"]
        desc <- map["desc"]
    }
}
