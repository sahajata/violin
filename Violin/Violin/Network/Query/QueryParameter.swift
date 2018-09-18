//
//  QueryParameter.swift
//  Violin
//
//  Created by liuzhiyi on 2018/9/10.
//  Copyright © 2018年 Karma. All rights reserved.
//

import ObjectMapper

open class QueryParameter: ViolinModel {
    
    
    public required init() { }
    
    public required init?(map: Map) {
    }
    
    open var pageNo: Int = 0
    
    open var pageSize: Int = 10
    
    // 是否计算总数
    open var totalable: Bool = true
    
    open var fieldOrders: [FieldOrder] = []
    
    open func mapping(map: Map) {
        pageNo <- map["pageNo"]
        pageSize <- map["pageSize"]
        totalable <- map["totalable"]
    }
    
    public func addOrder(name: String, desc: Bool) {
        let fieldOrder: FieldOrder = FieldOrder(name: name, desc: desc)
        fieldOrders.append(fieldOrder)
    }

    public func clearOrders() {
        fieldOrders.removeAll()
    }
}
