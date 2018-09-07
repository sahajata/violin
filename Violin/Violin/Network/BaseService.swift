//
//  service基础支持
//
//  Created by liuzhiyi on 2018/8/28.
//  Copyright © 2018年 Karma. All rights reserved.
//

import Foundation
import Moya
import SwiftyJSON
import ObjectMapper

public protocol BaseService {
    
    var serverUrl: String{ get }

    var beanId: String { get }
}

extension BaseService {
    
    private func buildService(_ methed: String, _ parameters: [Any]) -> SimpleService {
        var task: Task = .requestPlain
        if (parameters.count > 1 || parameters[0] != nil) {
            let encoding = URLEncoding(destination: .methodDependent, arrayEncoding: .noBrackets, boolEncoding: .literal)
            let json = JsonUtil.toJson(parameters).removeSpecialCharacters()
            let args = ["args": json]
            task = .requestParameters(parameters: args, encoding: encoding)
        }
        
        let service: SimpleService = SimpleService(baseURL: URL(string: serverUrl)!, path: "/\(beanId)/\(methed)", method: .post, task: task, headers: nil);
        return service
    }
    
    func request<T>(methed: String, parameters: Any..., succeed: @escaping (T)-> (), failure: @escaping(NetworkError)-> ()) {
        let service: SimpleService = buildService(methed, parameters)
        let failureBlock = {(error: Error) in
            // 处理将普通Error转换为NetworkError
            print("error")
        }
        Requester.request(service: service, succeed: succeed, failure: failureBlock)
    }
    
    func request<T>(methed: String, parameters: Any..., succeed: @escaping ([T])-> (), failure: @escaping(NetworkError)-> ()) {
        let service: SimpleService = buildService(methed, parameters)
        let failureBlock = {(error: Error) in
            // 处理将普通Error转换为NetworkError
            print("error")
        }
        Requester.request(service: service, succeed: succeed, failure: failureBlock)
    }
    
    func request<T: BaseMappable>(methed: String, parameters: Any..., succeed: @escaping (T)-> (), failure: @escaping(NetworkError)-> ()) {
        let service: SimpleService = buildService(methed, parameters)
        let failureBlock = {(error: Error) in
            // 处理将普通Error转换为NetworkError
            print("error")
        }
        Requester.request(service: service, succeed: succeed, failure: failureBlock)
    }
    
    func request<T: BaseMappable>(methed: String, parameters: Any..., succeed: @escaping ([T])-> (), failure: @escaping(NetworkError)-> ()) {
        let service: SimpleService = buildService(methed, parameters)
        let failureBlock = {(error: Error) in
            // 处理将普通Error转换为NetworkError
            print("error")
        }
        Requester.request(service: service, succeed: succeed, failure: failureBlock)
    }

}
