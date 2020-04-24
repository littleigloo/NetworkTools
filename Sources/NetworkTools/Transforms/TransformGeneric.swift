//
//  TransformGeneric.swift
//  NetworkTools
//
//  Created by Vitalis on 13/4/20.
//  Copyright © 2019 Neiron Digital. All rights reserved.
//

import Foundation
import ObjectMapper

/**
Server's all types handling
 
 Usage:
 ```
 class Some: Mappable {
    var some: Double?
 
    required init?(map: Map) {}
    
    func mapping(map: Map) {
        some <- (map["some"], Transform())
    }
 }
 ```
 
 this will handle both this case:
 ```
 {
    "some": 0.5
 }
 ```
 and this case:
 ```
 {
    "some": "0.5"
 }
 ```
 */
public class Transform<T: LosslessStringConvertible>: TransformType {
    //  MARK: - TYPEALIASES
    // ////////////////////////////////////
    public typealias Object = T
    public typealias JSON = String
    
    //  MARK: - INITS
    // ////////////////////////////////////
    public init() {}
    
    //  MARK: - METHODS
    // ////////////////////////////////////
    public func transformFromJSON(_ value: Any?) -> Object? {
        // Check if the value is String and try to convert it to type T
        if let stringValue = value as? String {
            return T(stringValue)
        }
        // Try to cast it to normal T type
        return value as? T
    }
    // ...........
    
    public func transformToJSON(_ value: Object?) -> JSON? {
        // This will always return String
        // but in most cases you will never need it
        guard let value = value else { return nil }
        return String(value)
    }
}
