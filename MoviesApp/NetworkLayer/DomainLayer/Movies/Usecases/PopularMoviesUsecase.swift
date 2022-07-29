//
//  GetBasicTokenUsecase.swift
//  MoveeWebService
//
//  Created by Oguz Tandogan on 13.12.2020.
//

import Foundation
import RxSwift

public class PopularMoviesUsecase: SingleUseCase<PopularMoviesRequestModel, PopularMoviesResponseModel, MoviesRepositoryInterface> {
    
    override func generateUseCase(parameter: PopularMoviesRequestModel, pathParameter: String?) -> Single<PopularMoviesResponseModel>? {
        return repository.getPopularMovies(params: parameter)

    }
}
