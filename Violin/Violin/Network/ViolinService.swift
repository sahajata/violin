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
import RxSwift

open class ViolinService {
    
    public required init() {}
    
    open var serverUrl: String {
        return String.EMPTY
    }

    open var beanId: String {
        return String.EMPTY
    }
    
    open var delegate: NetworkErrorDelegate?
    
    private func buildService(_ methed: String, _ parameters: [Any]) -> SimpleService {
        var task: Task = .requestPlain
        if (!parameters.isEmpty) {
            let encoding = URLEncoding(destination: .methodDependent, arrayEncoding: .noBrackets, boolEncoding: .literal)
            let json = JsonUtil.toJson(array: parameters).removeSpecialCharacters()
            let args = ["args": json]
            task = .requestParameters(parameters: args, encoding: encoding)
        }
        
        let service: SimpleService = SimpleService(baseURL: URL(string: serverUrl)!, path: "/\(beanId)/\(methed)", method: .post, task: task, headers: nil);
        return service
    }
    
    // MARK: 返回单个普通结果的泛型
    public func request<T>(methed: String, parameters: Any..., succeed: @escaping (T)-> (), failure: @escaping(NetworkError)-> ()) {
        request(methed: methed, parameters: parameters, succeed: succeed, failure: failure)
    }
    
    private func request<T>(methed: String, parameters: [Any], succeed: @escaping (T)-> (), failure: @escaping(NetworkError)-> ()) {
        let service: SimpleService = buildService(methed, parameters)
        let failureBlock = {(error: Error) in // TODO: 因为泛型原因导致无法通用处理UNAUTHORIZE异常，无奈冗余
            let callbackBlock = {() in
                self.request(methed: methed, parameters: parameters, succeed: succeed, failure: failure)
            }
            self.handleFailure(error: error, failure: failure, callback: callbackBlock)
        }
        Requester.request(service: service, succeed: succeed, failure: failureBlock)
    }
    
    // MARK: 返回普通结果集合的泛型
    public func request<T>(methed: String, parameters: Any..., succeed: @escaping ([T])-> (), failure: @escaping(NetworkError)-> ()) {
        request(methed: methed, parameters: parameters, succeed: succeed, failure: failure)
    }
    
    private func request<T>(methed: String, parameters: [Any], succeed: @escaping ([T])-> (), failure: @escaping(NetworkError)-> ()) {
        let service: SimpleService = buildService(methed, parameters)
        let failureBlock = {(error: Error) in // TODO: 因为泛型原因导致无法通用处理UNAUTHORIZE异常，无奈冗余
            let callbackBlock = {() in
                if (parameters.isEmpty) {
                    self.request(methed: methed, succeed: succeed, failure: failure)
                } else {
                    self.request(methed: methed, parameters: parameters, succeed: succeed, failure: failure)
                }
            }
            self.handleFailure(error: error, failure: failure, callback: callbackBlock)
        }
        Requester.request(service: service, succeed: succeed, failure: failureBlock)
    }
    
    // MARK: 返回单个实体结果的泛型
    public func request<T: BaseMappable>(methed: String, parameters: Any..., succeed: @escaping (T)-> (), failure: @escaping(NetworkError)-> ()) {
        request(methed: methed, parameters: parameters, succeed: succeed, failure: failure)
    }
    
    private func request<T: BaseMappable>(methed: String, parameters: [Any], succeed: @escaping (T)-> (), failure: @escaping(NetworkError)-> ()) {
        let service: SimpleService = buildService(methed, parameters)
        let failureBlock = {(error: Error) in // TODO: 因为泛型原因导致无法通用处理UNAUTHORIZE异常，无奈冗余
            let callbackBlock = {() in
                if (parameters.isEmpty) {
                    self.request(methed: methed, succeed: succeed, failure: failure)
                } else {
                    self.request(methed: methed, parameters: parameters, succeed: succeed, failure: failure)
                }
            }
            self.handleFailure(error: error, failure: failure, callback: callbackBlock)
        }
        Requester.request(service: service, succeed: succeed, failure: failureBlock)
    }
    
    // MARK: 返回实体结果集合的泛型
    public func request<T: BaseMappable>(methed: String, parameters: Any..., succeed: @escaping ([T])-> (), failure: @escaping(NetworkError)-> ()) {
        request(methed: methed, parameters: parameters, succeed: succeed, failure: failure)
    }
    
    private func request<T: BaseMappable>(methed: String, parameters: [Any], succeed: @escaping ([T])-> (), failure: @escaping(NetworkError)-> ()) {
        let service: SimpleService = buildService(methed, parameters)
        let failureBlock = {(error: Error) in // TODO: 因为泛型原因导致无法通用处理UNAUTHORIZE异常，无奈冗余
            let callbackBlock = {() in
                if (parameters.isEmpty) {
                    self.request(methed: methed, succeed: succeed, failure: failure)
                } else {
                    self.request(methed: methed, parameters: parameters, succeed: succeed, failure: failure)
                }
            }
            self.handleFailure(error: error, failure: failure, callback: callbackBlock)
        }
        Requester.request(service: service, succeed: succeed, failure: failureBlock)
    }
    
    // 返回字典结果的泛型
    public func request<T>(methed: String, parameters: Any..., succeed: @escaping (Dictionary<String, T>)-> (), failure: @escaping(NetworkError)-> ()) {
        request(methed: methed, parameters: parameters, succeed: succeed, failure: failure)
    }
    
    private func request<T>(methed: String, parameters: [Any], succeed: @escaping (Dictionary<String, T>)-> (), failure: @escaping(NetworkError)-> ()) {
        let service: SimpleService = buildService(methed, parameters)
        let failureBlock = {(error: Error) in // TODO: 因为泛型原因导致无法通用处理UNAUTHORIZE异常，无奈冗余
            let callbackBlock = {() in
                if (parameters.isEmpty) {
                    self.request(methed: methed, succeed: succeed, failure: failure)
                } else {
                    self.request(methed: methed, parameters: parameters, succeed: succeed, failure: failure)
                }
            }
            self.handleFailure(error: error, failure: failure, callback: callbackBlock)
        }
        Requester.request(service: service, succeed: succeed, failure: failureBlock)
    }
    
    // MARK: 处理异常
    private func handleFailure(error: Error, failure: @escaping(NetworkError)-> (), callback : @escaping () -> ()) {
        let delegate = self.delegate
        do {
            try NetworkErrorGoalkeeper.profiling(error)
        } catch NetworkError.UNAUTHORIZE {
            if (delegate != nil) {
                let queue = DispatchQueue(label: String.EMPTY)
                queue.async {
                    delegate?.handleUnauthorize(callback)
                }
            } else {
                failure(NetworkError.UNAUTHORIZE)
            }
        } catch NetworkError.DISCONNECTED {
            if (delegate != nil) {delegate?.handleDisconnected()}
            failure(NetworkError.DISCONNECTED)
        } catch NetworkError.BUSINESS_EXCEPTION(let messages) {
            if (delegate != nil) {delegate?.handleBusinessExcepion(messages: messages)}
            failure(NetworkError.BUSINESS_EXCEPTION(messages))
        } catch NetworkError.NOT_FOUND  {
            if (delegate != nil) {delegate?.handleNotFound()}
            failure(NetworkError.NOT_FOUND)
        } catch NetworkError.SERVER_EXCEPTION {
            if (delegate != nil) {delegate?.handleServiceException()}
            failure(NetworkError.SERVER_EXCEPTION)
        } catch NetworkError.TIMEOUT {
            if (delegate != nil) {delegate?.handleTimeout()}
            failure(NetworkError.TIMEOUT)
        } catch {
            if (delegate != nil) {delegate?.handleUnknown()}
            failure(NetworkError.UNKNOWN)
        }
    }
}


