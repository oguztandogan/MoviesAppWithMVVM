//
//  BaseResponseProtocol.swift
//  MoveeWebService
//
//  Created by Oguz Tandogan on 13.12.2020.
//

import Foundation

public protocol BaseResponseProtocol: CodableDataProtocol {
    
    var error: BaseErrorResponse? { get }
}
