//
//  HttpHeaderFields.swift
//  MoveeWebService
//
//  Created by Oguz Tandogan on 13.12.2020.
//

import Foundation

public enum HttpHeaderFields: GenericValueProtocol {
    public typealias Value = (String, String)
    
    case contentType
    
    public var value: (String, String) {
        switch self {
        case .contentType:
            return ("Content-Type", "application/json")
        }
    }
}
