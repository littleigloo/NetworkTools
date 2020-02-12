//
//  TransformStringToInt.swift
//  AlamofireTools
//
//  Created by Vitalis on 12/02/2020.
//  Copyright © 2019 Neiron Digital. All rights reserved.
//

import Foundation
import ObjectMapper

// ...........

open class TransformStringToInt: TransformType {
    
    // MARK: TYPEALIASES
    
    public typealias Object = Int
    public typealias JSON = String
    
    // MARK: INITS
    
    public init() {}
    
    // MARK: METHODS
    
    public func transformFromJSON(_ value: Any?) -> Int? {
        
        if value is Int {
            return value as? Int
        }
        
        guard let stringValue = value as? String else {
            print("NO value OR NOT String")
            return nil
        }
        
        return Int(stringValue)
    }
    
    ////////////////////////////////////////
    
    public func transformToJSON(_ value: Int?) -> String? {
        
        if let intValue = value {
            return "\(intValue)"
        }
        
        return nil
    }
}
