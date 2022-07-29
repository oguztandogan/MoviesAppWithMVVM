//
//  LottieManager.swift
//  MoviesApp
//
//  Created by Oguz Tandogan on 14.07.2022.
//

import Foundation
import RxSwift
import RxCocoa
import UIKit

class LottieManager: LottieManagerProtocol {
    

    private lazy var lottieAnimationView = LottieAnimationView()
    
    func onPreExecute() {
        guard let topMostViewController = UIApplication.topViewController() else { return }
        lottieAnimationView.show(in: topMostViewController.view)

    }
    func onPostExecute() {
        lottieAnimationView.hide()
    }

}
