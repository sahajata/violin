//
//  QueryParameter.swift
//  Violin
//
//  Created by liuzhiyi on 2018/9/10.
//  Copyright © 2018年 Karma. All rights reserved.
//

public class QueryParameter {
    
    var pageNo: Int = 0
    
    var pageSize: Int = 10
    
    var fieldOrders: Array<FieldOrder> = []
    
    public func addOrder(name: String, desc: Bool) {
        let fieldOrder: FieldOrder = FieldOrder(name: name, desc: desc)
        fieldOrders.append(fieldOrder)
    }
    
    public func clearOrders() {
        fieldOrders.removeAll()
    }
}
