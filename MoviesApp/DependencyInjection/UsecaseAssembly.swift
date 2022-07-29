//
//  UsecaseAssembyl.swift
//  Movee
//
//  Created by Oguz Tandogan on 13.12.2020.
//  Copyright © 2020 Oguz Tandogan. All rights reserved.
//

import Foundation
import Swinject
import SwinjectAutoregistration

class UsecaseAssembly: Assembly {
    func assemble(container: Container) {
        container.autoregister(PopularMoviesUsecase.self, initializer: PopularMoviesUsecase.init).inObjectScope(.weak)
        container.autoregister(MovieDetailsUsecase.self, initializer: MovieDetailsUsecase.init).inObjectScope(.weak)
    }
}
