//
//  BaseErrorResponse.swift
//  MoveeWebService
//
//  Created by Oguz Tandogan on 13.12.2020.
//

import Foundation

public class BaseErrorResponse: Codable, Error {
    public let errorCode: Int?
    public let errorMessage: String?
    public let success: Bool?
    
    public init(errorCode: Int? = nil, errorMessage: String? = nil, success: Bool? = nil) {
        self.errorCode = errorCode
        self.errorMessage = errorMessage
        self.success = success
    }
}
