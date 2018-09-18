//
//  查询结果
//  Violin
//
//  Created by liuzhiyi on 2018/9/17.
//  Copyright © 2018年 Karma. All rights reserved.
//

import ObjectMapper

public class QueryResult<R: ViolinModel>: ViolinModel {
    
    // 结果记录集
    open var records: Array<R>?
    
    // 分页信息
    open var paging: Paging?
    
    public required init() { }
    public required init?(map: Map) { }
    
    public func mapping(map: Map) {
        records <- map["records"]
        paging <- map["paging"]
    }
    
}
