//
//  AuthenticationOperationsRepositoryInterface.swift
//  MoveeWebService
//
//  Created by Oguz Tandogan on 14.12.2020.
//

import Foundation
import RxSwift

public protocol MoviesRepositoryInterface {
    
    func getPopularMovies(params: PopularMoviesRequestModel) -> Single<PopularMoviesResponseModel>
    func getMovieDetails(params: MovieDetailsRequestModel,movieId: String) -> Single<MovieDetailsResponseModel>

}
