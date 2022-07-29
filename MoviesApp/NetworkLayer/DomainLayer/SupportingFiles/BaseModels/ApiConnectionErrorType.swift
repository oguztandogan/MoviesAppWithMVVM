//
//  ApiConnectionErrorType.swift
//  MoveeWebService
//
//  Created by Oguz Tandogan on 13.12.2020.
//

import Foundation

public enum ApiConnectionErrorType {
    case missingData(Int)
    case connectionError(Int)
    case serverError(Int)
    case dataDecodedFailed(String)
}
