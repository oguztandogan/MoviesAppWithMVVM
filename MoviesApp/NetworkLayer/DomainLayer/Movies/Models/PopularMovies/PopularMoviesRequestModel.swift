//
//  BasicTokenRequestModel.swift
//  MoveeWebService
//
//  Created by Oguz Tandogan on 14.12.2020.
//

import Foundation

public class PopularMoviesRequestModel: CodableDataProtocol {
    private(set) var apiKey: String? = Endpoints.ApiKey.apiKey.value
    public init() {}
    
    public enum CodingKeys: String, CodingKey {

        case apiKey = "api_key"
    }
}

