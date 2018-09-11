//
//  请求器
//
//  Created by liuzhiyi on 2018/8/21.
//  Copyright © 2018年 Karma. All rights reserved.
//

import Foundation
import Moya
import Alamofire
import ObjectMapper
import RxSwift

public class Requester {
    
    // MARK: 普通类型返回值
    public static func request<T>(service: SimpleService, succeed: @escaping (T)-> (), failure: @escaping(Error)-> ()) -> Disposable {
        let provider = MoyaProvider<SimpleService>(plugins: [StatusCodeErrorPlugin()])
        let disposable: Disposable = provider.rx.request(service).mapJSON().subscribe{event in
            switch event {
            case .success(let element):
                succeed(element as! T)
            case .error(let error):
                self.error(error: error, failure: failure)
            }
        }
        return disposable
    }
    
    // MARK: 普通类型集合返回值
    public static func request<T>(service: SimpleService, succeed: @escaping ([T])-> (), failure: @escaping(Error)-> ()) -> Disposable {
        let provider = MoyaProvider<SimpleService>(plugins: [StatusCodeErrorPlugin()])
        let disposable: Disposable = provider.rx.request(service).mapJSON().subscribe{event in
            switch event {
            case .success(let element):
                debugPrint(element)
            case .error(let error):
                self.error(error: error, failure: failure)
            }
        }
        return disposable
    }
    
    // MARK: Model类型返回值
    public static func request<T: BaseMappable>(service: SimpleService, succeed: @escaping (T)-> (), failure: @escaping(Error)-> ()) -> Disposable {
        let provider = MoyaProvider<SimpleService>(plugins: [StatusCodeErrorPlugin()])
        let disposable: Disposable = provider.rx.request(service).mapObject(T.self).subscribe{event in
            switch event {
            case .success(let element):
                succeed(element)
            case .error(let error):
                self.error(error: error, failure: failure)
            }
        }
        return disposable
    }
    
    // MARK: Model集合类型返回值
    public static func request<T: BaseMappable>(service: SimpleService, succeed: @escaping ([T])-> (), failure: @escaping(Error)-> ()) -> Disposable {
        let provider = MoyaProvider<SimpleService>(plugins: [StatusCodeErrorPlugin()])
        let disposable: Disposable = provider.rx.request(service).mapArray(T.self).subscribe{event in
            switch event {
            case .success(let element):
                succeed(element)
            case .error(let error):
                self.error(error: error, failure: failure)
            }
        }
        return disposable
    }
    
    // MARK: 字典类型返回值
    public static func request<T>(service: SimpleService, succeed: @escaping (Dictionary<String, T>)-> (), failure: @escaping(Error)-> ()) -> Disposable {
        let provider = MoyaProvider<SimpleService>(plugins: [StatusCodeErrorPlugin()])
        let disposable: Disposable = provider.rx.request(service).mapJSON().subscribe{event in
            switch event {
            case .success(let element):
                debugPrint(element)
            case .error(let error):
                self.error(error: error, failure: failure)
            }
        }
        return disposable
    }
    
    private static func error(error: Error, failure: @escaping(Error)-> ()) {
        debugPrint(error)
        failure(error)
    }
}
