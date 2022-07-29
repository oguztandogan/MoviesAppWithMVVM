//
//  BaseResponse.swift
//  MoveeWebService
//
//  Created by Oguz Tandogan on 13.12.2020.
//

import Foundation

public class BaseResponse: BaseResponseProtocol {
    public var error: BaseErrorResponse?
    
    public init(error: BaseErrorResponse?){
        self.error = error
    }
}
