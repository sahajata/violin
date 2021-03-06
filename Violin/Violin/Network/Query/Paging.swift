//
//  分页信息
//  Violin
//
//  Created by liuzhiyi on 2018/9/17.
//  Copyright © 2018年 Karma. All rights reserved.
//
import ObjectMapper

public class Paging: ViolinModel {
    
    public static let UNKNOWN_TOTAL = -1
    
    open var pageSize: Int?
    open var pageNo: Int?
    open var total: Int = UNKNOWN_TOTAL
    open var morePage: Bool?
    
    public required init() { }
    public required init?(map: Map) { }
    
    public func mapping(map: Map) {
        pageSize <- map["pageSize"]
        pageNo <- map["pageNo"]
        total <- map["total"]
        morePage <- map["morePage"]
    }
}
