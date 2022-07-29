//
//  AuthenticationServiceModule.swift
//  MoveeWebService
//
//  Created by Oguz Tandogan on 14.12.2020.
//

import Foundation

public class PopularMoviesServiceModule: ApiServiceProvider<PopularMoviesRequestModel> {
    
    init(request: PopularMoviesRequestModel) {
        super.init(method: .get, path: MoviesPaths.popularMovies.value, pathType: .tmdbBaseUrl, isAuthRequested: false, data: request)
    }
}
