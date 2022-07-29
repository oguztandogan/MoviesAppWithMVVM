//
//  MovieDetailsRequestModel.swift
//  MoviesApp
//
//  Created by Oguz Tandogan on 17.07.2022.
//

import Foundation

public class MovieDetailsRequestModel: CodableDataProtocol {
    private(set) var apiKey: String? = Endpoints.ApiKey.apiKey.value

    public init() {
    }
    
}

