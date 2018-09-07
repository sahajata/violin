//
//  Response+Extension.swift
//  Violin
//
//  Created by liuzhiyi on 2018/8/30.
//  Copyright © 2018年 Karma. All rights reserved.
//

import Foundation
import Moya
import ObjectMapper

// MARK: BaseMappable
public extension Response {
    
    public func mapObject<T: BaseMappable>(_ type: T.Type, context: MapContext? = nil) throws -> T {
        guard let object = Mapper<T>(context: context).map(JSONObject: try mapJSON()) else {
            throw MoyaError.jsonMapping(self)
        }
        return object
    }

    public func mapArray<T: BaseMappable>(_ type: T.Type, context: MapContext? = nil) throws -> [T] {
        guard let array = try mapJSON() as? [[String : Any]] else {
            throw MoyaError.jsonMapping(self)
        }
        return Mapper<T>(context: context).mapArray(JSONArray: array)
    }
    
    public func mapObject<T: BaseMappable>(_ type: T.Type, atKeyPath keyPath: String, context: MapContext? = nil) throws -> T {
        guard let object = Mapper<T>(context: context).map(JSONObject: (try mapJSON() as? NSDictionary)?.value(forKeyPath: keyPath)) else {
            throw MoyaError.jsonMapping(self)
        }
        return object
    }
    
    public func mapArray<T: BaseMappable>(_ type: T.Type, atKeyPath keyPath: String, context: MapContext? = nil) throws -> [T] {
        guard let array = (try mapJSON() as? NSDictionary)?.value(forKeyPath: keyPath) as? [[String : Any]] else {
            throw MoyaError.jsonMapping(self)
        }
        return Mapper<T>(context: context).mapArray(JSONArray: array)
    }
}


// MARK: ImmutableMappable
public extension Response {

    public func mapObject<T: ImmutableMappable>(_ type: T.Type, context: MapContext? = nil) throws -> T {
        return try Mapper<T>(context: context).map(JSONObject: try mapJSON())
    }
    
    public func mapArray<T: ImmutableMappable>(_ type: T.Type, context: MapContext? = nil) throws -> [T] {
        guard let array = try mapJSON() as? [[String : Any]] else {
            throw MoyaError.jsonMapping(self)
        }
        return try Mapper<T>(context: context).mapArray(JSONArray: array)
    }
    
    public func mapObject<T: ImmutableMappable>(_ type: T.Type, atKeyPath keyPath: String, context: MapContext? = nil) throws -> T {
        guard let object = Mapper<T>(context: context).map(JSONObject: (try mapJSON() as? NSDictionary)?.value(forKeyPath: keyPath)) else {
            throw MoyaError.jsonMapping(self)
        }
        return object
    }
    
    public func mapArray<T: ImmutableMappable>(_ type: T.Type, atKeyPath keyPath: String, context: MapContext? = nil) throws -> [T] {
        guard let array = (try mapJSON() as? NSDictionary)?.value(forKeyPath: keyPath) as? [[String : Any]] else {
            throw MoyaError.jsonMapping(self)
        }
        return try Mapper<T>(context: context).mapArray(JSONArray: array)
    }
    
}
