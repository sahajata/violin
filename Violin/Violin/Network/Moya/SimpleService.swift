//
// 简单的Service
//
//  Created by liuzhiyi on 2018/8/22.
//  Copyright © 2018年 Karma. All rights reserved.
//

import Moya

public struct SimpleService : TargetType {
    
    public var baseURL: URL
    
    public var path: String
    
    public var method: Moya.Method
    
    public var sampleData: Data {return "".data(using: String.DEFAULT_ENCODING)!}
    
    public var task: Task
    
    public var headers: [String : String]?
    
}
