//
//  AuthenticationServices.swift
//  MoveeWebService
//
//  Created by Oguz Tandogan on 14.12.2020.
//

import Foundation

public class MoviesServices {

    public init() {
        
    }
    
    func getPopularMoviesParsedResultServiceModule(params: PopularMoviesRequestModel) -> PopularMoviesServiceModule {
        return PopularMoviesServiceModule(request: params)
    }
    
    func getMovieDetailsParsedResultServiceModule(params: MovieDetailsRequestModel,movieId: String) -> MovieDetailsServiceModule {
        return MovieDetailsServiceModule(request: params,movieId: movieId)
    }
}
