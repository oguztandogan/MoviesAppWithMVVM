//
//  BaseRequest.swift
//  MoveeWebService
//
//  Created by Oguz Tandogan on 13.12.2020.
//

import Foundation

public class BaseRequest: CodableDataProtocol {
    private(set) var userId: Int
    
    public init(userId: Int) {
        self.userId = userId
    }
}
