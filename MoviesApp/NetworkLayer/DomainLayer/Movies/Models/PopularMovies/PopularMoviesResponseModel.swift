//
//  GetBasicTokenResponseModel.swift
//  MoveeWebService
//
//  Created by Oguz Tandogan on 13.12.2020.
//

import Foundation

open class PopularMoviesResponseModel: BaseResponseProtocol {
    public var error: BaseErrorResponse?
    let results: [PopularMovie]
    
    init(results: [PopularMovie]) {
        self.results = results
    }
}
open class PopularMovie: Codable {
    
    public let poster_path: String?
    public let id: Int?
    public let title: String?
    public let vote_average: Double?
    public let overview: String?
    public let release_date: String?
    public let backdrop_path: String?

    init(poster_path : String?,
         id: Int?,
         title: String?,
         vote_average: Double?,
         overview: String?,
         release_date: String?,
         backdrop_path: String?) {
    self.poster_path = poster_path
    self.id = id
    self.title = title
    self.vote_average = vote_average
    self.overview = overview
    self.release_date = release_date
    self.backdrop_path = backdrop_path
    }
}
