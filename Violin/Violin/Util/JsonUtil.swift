//
//  JsonUtil.swift
//  Violin
//
//  Created by liuzhiyi on 2018/9/7.
//  Copyright © 2018年 Karma. All rights reserved.
//

import ObjectMapper
import SwiftyJSON

public class JsonUtil {
    
    public static func toJson(object: Any) -> String {
        var jsonObject = object
        if (object is ViolinModel){
            jsonObject = (object as! ViolinModel).toJSON()
        }
        let json = JSON(jsonObject)
        return json.rawString()!
    }
    
    public static func toJson(array: [Any]) -> String {
        var jsonArray = Array<Any>()
        for object in array {
            if (object is ViolinModel){
                jsonArray.append((object as! ViolinModel).toJSON())
            } else {
                jsonArray.append(object)
            }
        }
        let json = JSON(jsonArray)
        return json.rawString()!
    }
    
    public static func toJson(dict: Dictionary<String, Any>) -> String {
        var jsonDict = Dictionary<String, Any>()
        for (key, object) in dict {
            if (object is ViolinModel){
                jsonDict[key] = (object as! ViolinModel).toJSON()
            } else {
                jsonDict[key] = object
            }
        }
        let json = JSON(jsonDict)
        return json.rawString()!
    }
}
