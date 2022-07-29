//
//  MovieListRouter.swift
//  MoviesApp
//
//  Created by Oguz Tandogan on 29.07.2022.
//

import Foundation
import UIKit

protocol MovieListRouterProtocol: AnyObject {
    func pushMovieDetailController(movieId: String?)
}

class MovieListRouter: MovieListRouterProtocol {
    
    func pushMovieDetailController(movieId: String?) {
        guard let topMostViewController = UIApplication.topViewController() else { return }
        guard let movieId = movieId else {
            return
        }
        let movieDetailsViewModel = MovieDetailsViewModel(movieId: movieId)
        topMostViewController.navigationController?.pushViewController(MovieDetailsView(viewModel: movieDetailsViewModel), animated: true)
    }
}
