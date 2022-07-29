//
//  MovieListViewModel.swift
//  MoviesApp
//
//  Created by Oguz Tandogan on 27.07.2022.
//

import Foundation
import UIKit
import RxSwift

class MovieListViewModel: AssemblerProtocol {
    
    private var movieListRouter: MovieListRouterProtocol = MovieListRouter()
    let popularMovies = PublishSubject<[PopularMovie]>()
    private let popularMoviesCallback = MoviesCallback()
    private var popularMoviesUsecase: PopularMoviesUsecase?

    
    func getPopularMovies() {
        popularMoviesCallback.commonResult(completion: popularMoviesDatalistener)
        fetchPopularMovies(callback: popularMoviesCallback)
    }

    private lazy var popularMoviesDatalistener: (Result<PopularMoviesResponseModel, BaseErrorResponse>) -> Void = { [weak self] result in
        self?.popularMoviesListenerHandler(with: result)
    }
    
    private func popularMoviesListenerHandler(with result: Result<PopularMoviesResponseModel, BaseErrorResponse>) {
        switch result {
        case .failure(let error):
            print("error : \(error)")
        case .success(let response):
            popularMovies.onNext(response.results)
            popularMovies.onCompleted()
        }
    }
    
    func navigateToMovieDetails(movieId: String) {
        movieListRouter.pushMovieDetailController(movieId: movieId)
    }

}

// MARK - Interactor

extension MovieListViewModel {
    
    private func fetchPopularMovies(callback: MoviesCallback) {
        self.popularMoviesUsecase = self.returnResolver().resolve(PopularMoviesUsecase.self)
        self.popularMoviesUsecase?.execute(useCaseCallBack: callback, params: PopularMoviesRequestModel())
    }
}
