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
    
    //  MARK: - INITS
    // ////////////////////////////////////
    public init() {}
    
    //  MARK: - METHODS
    // ////////////////////////////////////
    public func transformFromJSON(_ value: Any?) -> Bool? {
        if value is Bool {
            return value as? Bool
        }
        if value is Int {
            guard let intValue = value as? Int else {
                return nil
            }
            switch intValue {
            case 0:
                return false
            case 1:
                return true
            default:
                print("UNEXPECTED BOOLEAN DESCRIPTOR")
                return nil
            }
        }
        if value is String {
            guard let stringValue = value as? String else {
                return nil
            }
            switch stringValue {
            case "0", "false":
                return false
            case "1", "true":
                return true
            default:
                print("UNEXPECTED BOOLEAN DESCRIPTOR")
                return nil
            }
        }
        print("COULD NOT TRANSFORM TO BOOL")
        return nil
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
