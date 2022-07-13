//
//  APIError.swift
//  ActorShowCase
//
//  Created by Ruttanachai Auitragool on 14/7/22.
//

import Foundation

struct APIError: Error {
    var code: Code?
    var message: String?
    var statusCode: Int?
    var fullResponse: String?
}

extension APIError {
    enum Code: String {
        case other
        case cancelled
        case unexpected
        case timeout
    }
}

extension APIError {
    static var cancelled: APIError {
        return APIError(code: .cancelled, message: "CANCEL", statusCode: 0)
    }
    
    static var unexpected: APIError {
        return APIError(code: .unexpected, message: "UNEXPECTED", statusCode: 0)
    }
    
    static var timeout: APIError {
        return APIError(code: .timeout, message: "TIMEOUT", statusCode: 0)
    }
}

