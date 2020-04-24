//
//  TransformGeneric.swift
//  NetworkTools
//
//  Created by Vitalis on 14/4/20.
//  Copyright © 2019 Neiron Digital. All rights reserved.
//

import Foundation
import ObjectMapper
// ...........

public class TransformStringToURL: TransformType {
    //  MARK: - TYPEALIASES
    // ////////////////////////////////////
    public typealias Object = URL
    public typealias JSON = String
    
    //  MARK: - INITS
    // ////////////////////////////////////
    public init() {}
    
    //  MARK: - METHODS
    // ////////////////////////////////////
    public func transformFromJSON(_ value: Any?) -> URL? {
        guard let stringValue = value as? String else {
            print("NO value OR NOT String")
            return nil
        }
        return stringValue.asURL
    }
    // ...........
    
    public func transformToJSON(_ value: URL?) -> String? {
        if let urlValue = value {
            return urlValue.absoluteString
        }
        return nil
    }
}
