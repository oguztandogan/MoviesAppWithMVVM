//
//  LottieAnimations.swift
//  MoviesApp
//
//  Created by Oguz Tandogan on 14.07.2022.
//

import Foundation

enum LottieAnimations: GenericValueProtocol {
    
    typealias Value = String
    
    case movieCameraAnimation
    
    var value: String {
        switch self {
        case .movieCameraAnimation:
            return "MovieCameraAnimation"
        }
    }
}
