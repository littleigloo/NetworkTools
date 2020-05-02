//
//  Extension+String.swift
//  NetworkTools
//
//  Created by Vitalis on 24/02/2020.
//  Copyright © 2019 Neiron Digital. All rights reserved.
//

import Foundation
import ObjectMapper
// ...........

public extension String {
    // ...........
    func to<T: Mappable>(mappableType: T.Type) -> T? {
        return Mapper<T>().map(JSONString: self)
    }
    // ...........
    
    // Returns a URL from string if conversion is possible or nil
    var asURL: URL? {
        guard !self.isEmpty else {
            return nil
        }
        guard let url = URL(stringToEncode: self) else {
            print("COULD NOT CREATE URL")
            return nil
        }
        return url
    }
}
