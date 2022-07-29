//
//  MovieDetailsResponseModel.swift
//  MoviesApp
//
//  Created by Oguz Tandogan on 17.07.2022.
//

import Foundation

// MARK: - Welcome
public struct MovieDetailsResponseModel: BaseResponseProtocol {
    public var error: BaseErrorResponse?
    public let adult: Bool?
    public let backdropPath: String?
    public let genres: [Genre?]?
    public let id: Int?
    public let imdbID: String?
    public let overview: String?
    public let popularity: Double?
    public let posterPath: String?
    public let releaseDate: String?
    public let title: String?
    public let video: Bool?
    public let voteAverage: Double?
    
    enum CodingKeys: String, CodingKey {
        case adult
        case backdropPath = "backdrop_path"
        case genres, id
        case imdbID = "imdb_id"
        case overview, popularity
        case posterPath = "poster_path"
        case releaseDate = "release_date"
        case title, video
        case voteAverage = "vote_average"
    }
}


// MARK: - Genre
public struct Genre: Codable {
    public let id: Int?
    public let name: String?
}
