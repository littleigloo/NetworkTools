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

public extension URLRequest {
    // Simple headers adding function
    mutating func addExtraHeaders(extraHeaders: [String: String]) {
        for (key, value) in extraHeaders {
            self.setValue( key, forHTTPHeaderField: value)
        }
    }
}
