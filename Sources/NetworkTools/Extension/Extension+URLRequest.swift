//
//  Extension+URLRequest.swift
//  NetworkTools
//
//  Created by Vitalis on 02/05/2020.
//  Copyright © 2019 Neiron Digital. All rights reserved.
//

import Foundation
import ObjectMapper
// ...........

public extension Mappable {
    var asString: String? {
        // Convert to raw string
        guard let JSONString = Mapper().toJSONString(self) else {
            print("COULD NOT CONVERT MAPPABLE TO RAW STRING")
            return nil
        }
        return JSONString
    }
}
