//
//  MoviesVC.swift
//  movies-ios
//
//  Created by Galileo Guzman on 26/11/20.
//

import UIKit

class MoviesVC: UIViewController {
    
    enum Section {
        case popular
    }

    @IBOutlet weak var collectionView: UICollectionView!
    
    var popularMovies:[Movie] = []
    var dataSource: UICollectionViewDiffableDataSource<Section, Movie>!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureViewController()
        getPopularMovies()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationItem.title = "Popular movies"
    }
    
    func configureViewController() {
        view.backgroundColor = .systemBackground
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    func getPopularMovies() {
        showLoadingView()
        
        NetworkManager.shared.getPopularMovies { [weak self] result in
            guard let self = self else { return }
            
            switch result {
                case .success(let popularMovies):
                    print(popularMovies)
                    self.popularMovies.append(contentsOf: popularMovies.results)
                    
                    //self.updateData(on: self.popularMovies)
                case .failure(let error):
                    print("Error \(error.rawValue)")
            }
            
            self.dismissLoadingView()
        }
    }
    
    func updateData(on movies: [Movie]) {
        var snapshot = NSDiffableDataSourceSnapshot<Section, Movie>()
        snapshot.appendSections([.popular])
        snapshot.appendItems(movies)
        
        DispatchQueue.main.async {
            self.dataSource.apply(snapshot, animatingDifferences: true)
        }
    }

}
