//
//  MovieListView.swift
//  MoviesApp
//
//  Created by Oguz Tandogan on 27.07.2022.
//

import Foundation
import UIKit
import RxSwift
import RxCocoa
import Kingfisher

class MovieListView: BaseViewController {
    
    private var movieListViewModel = MovieListViewModel()
    private var disposeBag = DisposeBag()
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: self.view.frame, style: .insetGrouped)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(MovieListTableViewCell.self, forCellReuseIdentifier: "MovieListTableViewCell")
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bindTableView()
        bindTableViewRowAction()
        bindTableViewWillDisplayCell()
        movieListViewModel.getPopularMovies()
        setupConstraints()
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
}

extension MovieListView: UITableViewDelegate {
    
    private func bindTableView() {
        view.addSubview(tableView)
        tableView.rx.setDelegate(self).disposed(by: disposeBag)
        movieListViewModel.popularMovies.bind(to: tableView.rx.items(cellIdentifier: "MovieListTableViewCell", cellType: MovieListTableViewCell.self)) { (row,item,cell) in
            cell.movieTitle.text = item.title
            let imageUrl = URL(string: BaseImageUrl.imageUrl.value + (item.poster_path ?? ""))
            cell.movieImageView.kf.setImage(with: imageUrl)
            cell.movieRating.text = item.vote_average?.description
        }.disposed(by: disposeBag)
    }
    
    private func bindTableViewRowAction() {
        tableView.rx.modelSelected(PopularMovie.self).subscribe(onNext: { [weak self] item in
            self?.movieListViewModel.navigateToMovieDetails(movieId: item.id?.description ?? "")
        }).disposed(by: disposeBag)
    }
    
    private func bindTableViewWillDisplayCell() {
        tableView.rx.willDisplayCell.subscribe { cell, indexPath in
            cell.layer.transform = CATransform3DMakeScale(0.1,0.1,1)
            UIView.animate(withDuration: 0.25, animations: {
                cell.layer.transform = CATransform3DMakeScale(1,1,1)
            })
        }.disposed(by: disposeBag)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }

}
