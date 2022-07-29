//
//  MovieDetailsUsecase.swift
//  MoviesApp
//
//  Created by Oguz Tandogan on 17.07.2022.
//

import Foundation
import RxSwift

public class MovieDetailsUsecase: SingleUseCase<MovieDetailsRequestModel, MovieDetailsResponseModel, MoviesRepositoryInterface> {
    
    
    override func generateUseCase(parameter: MovieDetailsRequestModel, pathParameter: String?) -> Single<MovieDetailsResponseModel>? {
        return repository.getMovieDetails(params: parameter, movieId: pathParameter!)
    }
}
