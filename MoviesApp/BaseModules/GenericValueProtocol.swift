//
//  GenericValueProtocol.swift
//  NetworkService
//
//  Created by Oguz Tandogan on 11.07.2022.
//

import Foundation

public protocol GenericValueProtocol {
    
    associatedtype Value
    var value: Value { get }
}
