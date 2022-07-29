//
//  LottieAnimationManager.swift
//  MoviesApp
//
//  Created by Oguz Tandogan on 28.07.2022.
//

import Foundation
import UIKit
import Lottie

class LottieAnimationView{
    
//    static let shared = LottieAnimationView()

//    private init() { }
    
    func show(in view: UIView) {
        loadingView.center = view.center
        view.addSubview(loadingView)
        loadingView.play()
    }
    
    private lazy var loadingView: AnimationView = {
        let jsonName = "MovieCameraAnimation"
        let animation = Animation.named(jsonName)
        let animationView = AnimationView(animation: animation)
        animationView.frame = CGRect(origin: .zero,
                                     size: CGSize(width: 200, height: 200))
        animationView.loopMode = .loop
        animationView.animationSpeed = 0.5
        return animationView
    }()

    func hide() {
        loadingView.stop()
        loadingView.removeFromSuperview()
    }
}
