//
//  MovieDetailsServiceModule.swift
//  MoviesApp
//
//  Created by Oguz Tandogan on 17.07.2022.
//

import Foundation

public class MovieDetailsServiceModule: ApiServiceProvider<MovieDetailsRequestModel> {
    
    init(request: MovieDetailsRequestModel, movieId: String) {
        super.init(method: .get, path: MoviesPaths.movieDetails(movieId).value, pathType: .tmdbBaseUrl, isAuthRequested: false, data: request)
    }
}
