//
//  TransformBool.swift
//  NetworkTools
//
//  Created by Vitalis on 14/4/20.
//  Copyright © 2019 Neiron Digital. All rights reserved.
//

import Foundation
import ObjectMapper
// ...........

open class TransformBool: TransformType {
    //  MARK: - TYPEALIASES
    // ////////////////////////////////////
    public typealias Object = Bool
    public typealias JSON = String
    
    //  MARK: - PROPERTIES 🔰 PRIVATE
    // ////////////////////////////////////
    let defaultValue: Bool?
    
    //  MARK: - INITS
    // ////////////////////////////////////
    public init(defaultValue: Bool? = nil) {
        self.defaultValue = defaultValue
    }
    
    //  MARK: - METHODS
    // ////////////////////////////////////
    public func transformFromJSON(_ value: Any?) -> Bool? {
        if value is Bool {
            return value as? Bool
        }
        if value is Int {
            guard let intValue = value as? Int else {
                return defaultValue
            }
            switch intValue {
            case 0:
                return false
            case 1:
                return true
            default:
                print("UNEXPECTED BOOLEAN DESCRIPTOR")
                return defaultValue
            }
        }
        if value is String {
            guard let stringValue = value as? String else {
                return defaultValue
            }
            switch stringValue {
            case "0", "false":
                return false
            case "1", "true":
                return true
            default:
                print("UNEXPECTED BOOLEAN DESCRIPTOR")
                return defaultValue
            }
        }
        print("COULD NOT TRANSFORM TO BOOL")
        return defaultValue
    }
    // ...........
    
    public func transformToJSON(_ value: Bool?) -> String? {
        if let boolValue = value {
            switch boolValue {
            case true:
                return "1"
            case false:
                return "0"
            }
        }
        return nil
    }
}
