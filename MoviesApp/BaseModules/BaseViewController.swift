//
//  BaseViewController.swift
//  MoviesApp
//
//  Created by Oguz Tandogan on 15.07.2022.
//

import Foundation
import UIKit

class BaseViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationController()
    }
    
    func setupNavigationController() {
        if #available(iOS 13.0, *) {
            let appearance = UINavigationBarAppearance()
            appearance.configureWithOpaqueBackground()
            appearance.backgroundColor = ColorAsset.persianPink.value
            appearance.titleTextAttributes = [.font:
                                                UIFont.boldSystemFont(ofSize: 20.0),
                                              .foregroundColor: UIColor.white]
            navigationController?.navigationBar.standardAppearance = appearance
            navigationController?.navigationBar.scrollEdgeAppearance = appearance
            navigationController?.navigationItem.titleView?.tintColor = .darkGray
            navigationController?.isNavigationBarHidden = false
            navigationItem.title = "Movies App"
            navigationController?.navigationBar.isTranslucent = false
        } else {
            navigationController?.navigationBar.barTintColor = ColorAsset.persianPink.value
            navigationController?.navigationItem.titleView?.tintColor = .darkGray
            navigationController?.isNavigationBarHidden = false
            navigationItem.title = "Movies App"
            navigationController?.navigationBar.isTranslucent = false
        }
    }
}
