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
import MBProgressHUD

open class ViolinService {
    
    public required init() {}
    
    open var serverUrl: String {
        return String.EMPTY
    }

    open var beanId: String {
        return String.EMPTY
    }
    
    open var delegate: NetworkErrorDelegate?
    
    public func upload(methed: String, file: Data, name: String, succeed: @escaping (UploadResult)-> (), failure: @escaping(NetworkError)-> ()) {
        var hud: MBProgressHUD? = nil
        if (delegate != nil) { hud = delegate?.beginLoading() }
        let data = MultipartFormData(provider: MultipartFormData.FormDataProvider.data(file), name: "file", fileName: name, mimeType: "image/png")
        let task: Task = .uploadMultipart([data])
        let service: SimpleService = SimpleService(baseURL: URL(string: serverUrl)!, path: "/\(beanId)/\(methed)", method: .post, task: task);
        
        let succeedBlock = {(result: [UploadResult]) in
            if (self.delegate != nil && hud != nil) { self.delegate?.endLoading(hud: hud!) }
            succeed(result[0])
        }
        
        let failureBlock = {(error: Error) in // 因为泛型原因导致无法通用处理UNAUTHORIZE异常，无奈冗余
            if (self.delegate != nil && hud != nil) { self.delegate?.endLoading(hud: hud!) }
            let callbackBlock = {() in
                self.upload(methed: methed, file: file, name: name, succeed: succeed, failure: failure)
            }
            self.handleFailure(error: error, failure: failure, callback: callbackBlock)
        }
        Requester.request(service: service, succeed: succeedBlock, failure: failureBlock)
    }
    
    public func upload(methed: String, files: Dictionary<String, Data>, succeed: @escaping ([UploadResult])-> (), failure: @escaping(NetworkError)-> ()) {
        var hud: MBProgressHUD? = nil
        if (delegate != nil) { hud = delegate?.beginLoading() }
        var data = [MultipartFormData]()
        for (name,file) in files {
            data.append(MultipartFormData(provider: MultipartFormData.FormDataProvider.data(file), name: "file", fileName: name, mimeType: "image/png"))
        }
        let task: Task = .uploadMultipart(data)
        let service: SimpleService = SimpleService(baseURL: URL(string: serverUrl)!, path: "/\(beanId)/\(methed)", method: .post, task: task);
        
        let succedBlock = {(result: [UploadResult]) in
            if (self.delegate != nil && hud != nil) { self.delegate?.endLoading(hud: hud!) }
            succeed(result)
        }
        let failureBlock = {(error: Error) in // 因为泛型原因导致无法通用处理UNAUTHORIZE异常，无奈冗余
            if (self.delegate != nil && hud != nil) { self.delegate?.endLoading(hud: hud!) }
            let callbackBlock = {() in
                self.upload(methed: methed, files: files, succeed: succeed, failure: failure)
            }
            self.handleFailure(error: error, failure: failure, callback: callbackBlock)
        }
        Requester.request(service: service, succeed: succedBlock, failure: failureBlock)
    }
    
    private func buildService(_ methed: String, _ parameters: [Any]) -> SimpleService {
        var task: Task = .requestPlain
        if (!parameters.isEmpty) {
            let encoding = URLEncoding(destination: .methodDependent, arrayEncoding: .noBrackets, boolEncoding: .literal)
            let json = JsonUtil.toJson(array: parameters)
            print("request data: \(json)")
            let args = ["args": json]
            task = .requestParameters(parameters: args, encoding: encoding)
        }
        
        let service: SimpleService = SimpleService(baseURL: URL(string: serverUrl)!, path: "/\(beanId)/\(methed)", method: .post, task: task);
        return service
    }
    
    // MARK: 返回单个普通结果的泛型
    public func request<T>(methed: String, parameters: Any..., succeed: @escaping (T)-> (), failure: @escaping(NetworkError)-> ()) {
        request(methed: methed, parameters: parameters, succeed: succeed, failure: failure)
    }
    
    private func request<T>(methed: String, parameters: [Any], succeed: @escaping (T)-> (), failure: @escaping(NetworkError)-> ()) {
        var hud: MBProgressHUD? = nil
        if (delegate != nil) { hud = delegate?.beginLoading() }
        let service: SimpleService = buildService(methed, parameters)
        let succedBlock = {(result: T) in
            if (self.delegate != nil && hud != nil) { self.delegate?.endLoading(hud: hud!) }
            succeed(result)
        }
        let failureBlock = {(error: Error) in // 因为泛型原因导致无法通用处理UNAUTHORIZE异常，无奈冗余
            if (self.delegate != nil && hud != nil) { self.delegate?.endLoading(hud: hud!) }
            let callbackBlock = {() in
                self.request(methed: methed, parameters: parameters, succeed: succeed, failure: failure)
            }
            self.handleFailure(error: error, failure: failure, callback: callbackBlock)
        }
        Requester.request(service: service, succeed: succedBlock, failure: failureBlock)
    }
    
    // MARK: 返回普通结果集合的泛型
    public func request<T>(methed: String, parameters: Any..., succeed: @escaping ([T])-> (), failure: @escaping(NetworkError)-> ()) {
        request(methed: methed, parameters: parameters, succeed: succeed, failure: failure)
    }
    
    private func request<T>(methed: String, parameters: [Any], succeed: @escaping ([T])-> (), failure: @escaping(NetworkError)-> ()) {
        var hud: MBProgressHUD? = nil
        if (delegate != nil) { hud = delegate?.beginLoading() }
        let service: SimpleService = buildService(methed, parameters)
        
        let succedBlock = {(result: [T]) in
            if (self.delegate != nil && hud != nil) { self.delegate?.endLoading(hud: hud!) }
            succeed(result)
        }
        
        let failureBlock = {(error: Error) in // 因为泛型原因导致无法通用处理UNAUTHORIZE异常，无奈冗余
            if (self.delegate != nil && hud != nil) { self.delegate?.endLoading(hud: hud!) }
            let callbackBlock = {() in
                self.request(methed: methed, parameters: parameters, succeed: succeed, failure: failure)
            }
            self.handleFailure(error: error, failure: failure, callback: callbackBlock)
        }
        Requester.request(service: service, succeed: succedBlock, failure: failureBlock)
    }
    
    // MARK: 返回单个实体结果的泛型
    public func request<T: BaseMappable>(methed: String, parameters: Any..., succeed: @escaping (T)-> (), failure: @escaping(NetworkError)-> ()) {
        request(methed: methed, parameters: parameters, succeed: succeed, failure: failure)
    }
    
    private func request<T: BaseMappable>(methed: String, parameters: [Any], succeed: @escaping (T)-> (), failure: @escaping(NetworkError)-> ()) {
        var hud: MBProgressHUD? = nil
        if (delegate != nil) { hud = delegate?.beginLoading() }
        let service: SimpleService = buildService(methed, parameters)
        
        let succedBlock = {(result: T) in
            if (self.delegate != nil && hud != nil) { self.delegate?.endLoading(hud: hud!) }
            succeed(result)
        }
        
        let failureBlock = {(error: Error) in // 因为泛型原因导致无法通用处理UNAUTHORIZE异常，无奈冗余
            if (self.delegate != nil && hud != nil) { self.delegate?.endLoading(hud: hud!) }
            let callbackBlock = {() in
                self.request(methed: methed, parameters: parameters, succeed: succeed, failure: failure)
            }
            self.handleFailure(error: error, failure: failure, callback: callbackBlock)
        }
        Requester.request(service: service, succeed: succedBlock, failure: failureBlock)
    }
    
    // MARK: 返回实体结果集合的泛型
    public func request<T: BaseMappable>(methed: String, parameters: Any..., succeed: @escaping ([T])-> (), failure: @escaping(NetworkError)-> ()) {
        request(methed: methed, parameters: parameters, succeed: succeed, failure: failure)
    }
    
    private func request<T: BaseMappable>(methed: String, parameters: [Any], succeed: @escaping ([T])-> (), failure: @escaping(NetworkError)-> ()) {
        var hud: MBProgressHUD? = nil
        if (delegate != nil) { hud = delegate?.beginLoading() }
        let service: SimpleService = buildService(methed, parameters)
        
        let succedBlock = {(result: [T]) in
            if (self.delegate != nil && hud != nil) { self.delegate?.endLoading(hud: hud!) }
            succeed(result)
        }
        
        let failureBlock = {(error: Error) in // 因为泛型原因导致无法通用处理UNAUTHORIZE异常，无奈冗余
            if (self.delegate != nil && hud != nil) { self.delegate?.endLoading(hud: hud!) }
            let callbackBlock = {() in
                self.request(methed: methed, parameters: parameters, succeed: succeed, failure: failure)
            }
            self.handleFailure(error: error, failure: failure, callback: callbackBlock)
        }
        Requester.request(service: service, succeed: succedBlock, failure: failureBlock)
    }
    
    // 返回字典结果的泛型
    public func request<T>(methed: String, parameters: Any..., succeed: @escaping (Dictionary<String, T>)-> (), failure: @escaping(NetworkError)-> ()) {
        request(methed: methed, parameters: parameters, succeed: succeed, failure: failure)
    }
    
    private func request<T>(methed: String, parameters: [Any], succeed: @escaping (Dictionary<String, T>)-> (), failure: @escaping(NetworkError)-> ()) {
        var hud: MBProgressHUD? = nil
        if (delegate != nil) { hud = delegate?.beginLoading() }
        let service: SimpleService = buildService(methed, parameters)
        
        let succedBlock = {(result: Dictionary<String, T>) in
            if (self.delegate != nil && hud != nil) { self.delegate?.endLoading(hud: hud!) }
            succeed(result)
        }
        
        let failureBlock = {(error: Error) in // 因为泛型原因导致无法通用处理UNAUTHORIZE异常，无奈冗余
            if (self.delegate != nil && hud != nil) { self.delegate?.endLoading(hud: hud!) }
            let callbackBlock = {() in
                self.request(methed: methed, parameters: parameters, succeed: succeed, failure: failure)
            }
            self.handleFailure(error: error, failure: failure, callback: callbackBlock)
        }
        Requester.request(service: service, succeed: succedBlock, failure: failureBlock)
    }
    
    // 无返回结果
    public func request(methed: String, parameters: Any..., succeed: @escaping ()-> (), failure: @escaping(NetworkError)-> ()) {
        request(methed: methed, parameters: parameters, succeed: succeed, failure: failure)
    }
    
    private func request(methed: String, parameters: [Any], succeed: @escaping ()-> (), failure: @escaping(NetworkError)-> ()) {
        var hud: MBProgressHUD? = nil
        if (delegate != nil) { hud = delegate?.beginLoading() }
        let service: SimpleService = buildService(methed, parameters)
        
        let succedBlock = {() in
            if (self.delegate != nil && hud != nil) { self.delegate?.endLoading(hud: hud!) }
            succeed()
        }
        
        let failureBlock = {(error: Error) in // 因为泛型原因导致无法通用处理UNAUTHORIZE异常，无奈冗余
            if (self.delegate != nil && hud != nil) { self.delegate?.endLoading(hud: hud!) }
            let callbackBlock = {() in
                self.request(methed: methed, parameters: parameters, succeed: succeed, failure: failure)
            }
            self.handleFailure(error: error, failure: failure, callback: callbackBlock)
        }
        Requester.request(service: service, succeed: succedBlock, failure: failureBlock)
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


