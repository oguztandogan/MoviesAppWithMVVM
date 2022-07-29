//
//  UsecaseListenerManager.swift
//  MoviesApp
//
//  Created by Oguz Tandogan on 14.07.2022.
//

import Foundation

class UseCaseListenerManager: UseCaseListener {
    
    private let lottieManager: LottieManagerProtocol
    
    init(lottieManager: LottieManagerProtocol) {
        self.lottieManager = lottieManager
    }
    
    func onPreExecute() {
        lottieManager.onPreExecute()
    }
    
    func onPostExecute() {
        lottieManager.onPostExecute()
    }
    
    deinit {
        print("deinit")
    }
}
