//
//  GenericErrorResponseModule.swift
//  MoveeWebService
//
//  Created by Oguz Tandogan on 13.12.2020.
//

import Foundation

public class GenericErrorResponseModule: Error {
    
    public let errorResponse: BaseErrorResponse?
    public let apiConnectionErrorType: ApiConnectionErrorType?
    
    public init(errorResponse: BaseErrorResponse? = nil, apiConnectionErrorType: ApiConnectionErrorType? = nil) {
        self.errorResponse = errorResponse
        self.apiConnectionErrorType = apiConnectionErrorType
    }
}
