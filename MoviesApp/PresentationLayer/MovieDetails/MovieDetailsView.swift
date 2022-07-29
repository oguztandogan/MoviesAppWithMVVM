//
//  MovieDetailsView.swift
//  MoviesApp
//
//  Created by Oguz Tandogan on 27.07.2022.
//

import Foundation
import UIKit
import RxSwift
import RxCocoa
import Kingfisher

class MovieDetailsView: BaseViewController {
    
    var movieDetailsViewModel: MovieDetailsViewModel?
    private var disposeBag = DisposeBag()
    var movieId: String?
    
    
    init(viewModel: MovieDetailsViewModel?) {
        super.init(nibName: nil, bundle: nil)
        self.movieDetailsViewModel = viewModel
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private lazy var scrollView = UIScrollView()
    private lazy var containerView = UIView()
    
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var movieTitle: UILabel = {
        let title = UILabel()
        title.translatesAutoresizingMaskIntoConstraints = false
        title.lineBreakMode = .byWordWrapping
        title.font = UIFont(name: "American Typewriter Bold", size: 22)
        title.isHighlighted = true
        title.textColor = ColorAsset.russianViolet.value
        title.numberOfLines = 0
        title.textAlignment = .left
        return title
    }()
    
    private lazy var summaryLabel: UILabel = {
        let summary = UILabel()
        summary.translatesAutoresizingMaskIntoConstraints = false
        summary.lineBreakMode = .byWordWrapping
        summary.font = UIFont(name: "American Typewriter", size: 18)
        summary.textColor = ColorAsset.russianViolet.value
        summary.numberOfLines = 0
        summary.textAlignment = .left
        return summary
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addScrollView()
        bindMovieImageView()
        bindMovieTitleLabel()
        bindMovieSummaryLabel()
        movieDetailsViewModel?.getMovieDetails()
        setupConstraints()
    }
    
    private func addScrollView() {
        scrollView.backgroundColor = ColorAsset.persianPink.value
        containerView.backgroundColor = ColorAsset.persianPink.value
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        containerView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(scrollView)
        scrollView.addSubview(containerView)
    }
    
    private func bindMovieImageView() {
        containerView.addSubview(imageView)
        
        movieDetailsViewModel?.movieDetails
            .map{$0.backdropPath }
            .subscribe(onNext: { url in
                let imageUrl = URL(string: BaseImageUrl.imageUrl.value + (url ?? ""))
                self.imageView.kf.setImage(with: imageUrl,
                                           options: [
                                            .transition(.fade(1)),
                                            .cacheOriginalImage
                ])
            }).disposed(by: disposeBag)
    }
    
    private func bindMovieTitleLabel() {
        
        containerView.addSubview(movieTitle)

        movieDetailsViewModel?.movieDetails
            .map{$0.title }
            .bind(to: self.movieTitle.rx.text)
            .disposed(by: disposeBag)

    }
    
    private func bindMovieSummaryLabel() {
        containerView.addSubview(summaryLabel)

        movieDetailsViewModel?.movieDetails
            .map{$0.overview }
            .bind(to: self.summaryLabel.rx.text)
            .disposed(by: disposeBag)
    }
    

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            containerView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            containerView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            containerView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            containerView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            
            imageView.topAnchor.constraint(equalTo: containerView.topAnchor),
            imageView.bottomAnchor.constraint(equalTo: movieTitle.topAnchor, constant: -10),
            imageView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            
            movieTitle.bottomAnchor.constraint(equalTo: summaryLabel.topAnchor, constant: -10),
            movieTitle.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 10),
            movieTitle.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -10),

            summaryLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 10),
            summaryLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -10),
            summaryLabel.bottomAnchor.constraint(equalTo: containerView.bottomAnchor),
        ])
    }
}
