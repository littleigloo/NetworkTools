//
//  Extension+URL.swift
//  NetworkTools
//
//  Created by Vitalis on 24/02/2020.
//  Copyright © 2019 Neiron Digital. All rights reserved.
//

import Foundation
// ...........

public extension URL {
    // Encodes a string and returns URL
    init?(stringToEncode: String) {
        guard let urlwithPercentEscapes = stringToEncode.addingPercentEncoding(withAllowedCharacters: NSCharacterSet.urlQueryAllowed) else {
            print("COULD NOT ENCODE URL STRING")
            return nil
        }
        self.init(string: urlwithPercentEscapes)
    }
}
