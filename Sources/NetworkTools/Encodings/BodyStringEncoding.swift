//
//  BodyStringEncoding.swift
//  NetworkTools
//
//  Created by Vitalis on 12/02/2020.
//  Copyright © 2019 Neiron Digital. All rights reserved.
//

import Foundation
import Alamofire

// ...........

public struct BodyStringEncoding: ParameterEncoding {
    
    //  MARK: - PROPERTIES 🔰 PRIVATE
    // ////////////////////////////////////

    private let body: String?
    
    //  MARK: - INITS
    // ////////////////////////////////////

    public init(body: String?) { self.body = body }
    
    //  MARK: - METHODS 🌐 PUBLIC
    // ///////////////////////////////////////////

    public func encode(_ urlRequest: URLRequestConvertible, with parameters: Parameters?) throws -> URLRequest {
        
        guard var urlRequest = urlRequest.urlRequest else {
            throw Errors.emptyURLRequest
        }
        
        guard let body = body else {
            return urlRequest
        }
        
        guard let data = body.data(using: .utf8) else {
            throw Errors.encodingProblem
        }
        
        urlRequest.httpBody = data
        return urlRequest
    }
}

//                                      MARK: - BodyStringEncoding
//..............................................................................................

public extension BodyStringEncoding {
    
    enum Errors: Error {
        case emptyURLRequest
        case encodingProblem
    }
}

//                                      MARK: - BodyStringEncoding.Errors
//..............................................................................................

extension BodyStringEncoding.Errors: LocalizedError {
    
    public var errorDescription: String? {
        
        switch self {
            case .emptyURLRequest: return "Empty url request"
            case .encodingProblem: return "Encoding problem"
        }
    }
}
