//
//  UploadResult.swift
//  Violin
//
//  Created by liuzhiyi on 2018/10/16.
//  Copyright © 2018年 Karma. All rights reserved.
//

import Foundation
import ObjectMapper

open class UploadResult: ViolinModel {
    
    public required init() { }
    
    public required init?(map: Map) {
    }
    
    public var filename: String?
    public var storageUrl: String?
    public var readUrl: String?
    
    open func mapping(map: Map) {
        filename <- map["filename"]
        storageUrl <- map["storageUrl"]
        readUrl <- map["readUrl"]
    }
}
