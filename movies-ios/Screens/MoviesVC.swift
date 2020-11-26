//
//  MoviesVC.swift
//  movies-ios
//
//  Created by Galileo Guzman on 26/11/20.
//

import UIKit

class MoviesVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureViewController()
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationItem.title = "Popular movies"
    }
    
    func configureViewController() {
        view.backgroundColor = .systemBackground
        navigationController?.navigationBar.prefersLargeTitles = true
    }

}
