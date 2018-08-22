//
//  请求器
//
//  Created by liuzhiyi on 2018/8/21.
//  Copyright © 2018年 Karma. All rights reserved.
//

import Foundation
import Alamofire

public class Requester : NSObject {
    
    
    public static func request(url: String, method: HTTPMethod = .post, parameters: Parameters? = nil, encoding: ParameterEncoding = URLEncoding.default, headers: HTTPHeaders? = nil, succeed: @escaping (DataResponse<Any>?)-> (), failure: @escaping(DataResponse<Any>?)-> ()) {
        let request: DataRequest = Alamofire.request(url, method: method, parameters: parameters, encoding: encoding, headers: headers);
        request.responseJSON { response in
            if (response.result.isSuccess) {
                debugPrint("succeed:\n\(String(describing: response.result.value))")
                succeed(response)
            } else {
                debugPrint("failure:\n\(String(describing: response.result.error))")
                failure(response)
            }
        }
    }
}
