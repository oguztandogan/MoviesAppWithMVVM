//
//  MovieDetailsViewModel.swift
//  MoviesApp
//
//  Created by Oguz Tandogan on 27.07.2022.
//

import Foundation
import RxSwift

class MovieDetailsViewModel: AssemblerProtocol {
    
    let movieDetails = PublishSubject<MovieDetailsResponseModel>()
    private let movieDetailsCallback = MovieDetailsCallback()
    private var movieDetailsUsecase: MovieDetailsUsecase?
    private var movieId: String?
    
    init(movieId: String) {
        self.movieId = movieId
    }
    
    func getMovieDetails() {
        movieDetailsCallback.commonResult(completion: movieDetailsDataListener)
        fetchMovieDetails(callback: movieDetailsCallback, movieId: movieId ?? "")
    }

    private lazy var movieDetailsDataListener: (Result<MovieDetailsResponseModel, BaseErrorResponse>) -> Void = { [weak self] result in
        self?.movieDetailsListenerHandler(with: result)
    }
    
    private func movieDetailsListenerHandler(with result: Result<MovieDetailsResponseModel, BaseErrorResponse>) {
        switch result {
        case .failure(let error):
            print("error : \(error)")
        case .success(let response):
            movieDetails.onNext(response)
            movieDetails.onCompleted()
        }
    }
    
}

extension MovieDetailsViewModel {
    private func fetchMovieDetails(callback: MovieDetailsCallback, movieId: String) {
        self.movieDetailsUsecase = self.returnResolver().resolve(MovieDetailsUsecase.self)
        self.movieDetailsUsecase?.execute(useCaseCallBack: callback, params: MovieDetailsRequestModel(), pathParameter: movieId)
    }
}
