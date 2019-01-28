//
//  HomeMoviesViewController.swift
//  Movies
//
//  Created by Thiago Cavalcante de Oliveira on 12/01/19.
//  Copyright © 2019 Thiago Cavalcante de Oliveira. All rights reserved.
//

import UIKit

class HomeMoviesViewController: UIViewController {
    
    //MARK: - Variables
    var viewModel:HomeMoviesViewModel?
    var activityIndicator = UIActivityIndicatorView(style: UIActivityIndicatorView.Style.gray)

    
    //MARK: - Outlets
    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var searchMovies: UISearchBar!
    
    @IBOutlet weak var searchMessageView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupCollecitionView()
        self.viewModel = HomeMoviesViewModel(view: self)
        self.searchMovies.delegate = self
    }
    
    func setupCollecitionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    @IBAction func buttonFavorite(_ sender: Any) {
        if let idMovie = (sender as AnyObject).tag {
            let movieIsFavorite = viewModel?.getFavoriteMovie(idSelected: idMovie)
            if(movieIsFavorite ?? false) {
                let imageFavorite = UIImage(named: "favorite_gray_icon")?.withRenderingMode(.alwaysOriginal)
                (sender as AnyObject).setImage(imageFavorite, for: .normal)
                viewModel?.deleteFavoriteMovieDb(MovieId: (sender as AnyObject).tag)
                
            }
            else{
                let imageFavorite = UIImage(named: "favorite_full_icon")?.withRenderingMode(.alwaysOriginal)
                
                (sender as AnyObject).setImage(imageFavorite, for: .normal)
                viewModel?.saveFavoriteMovieDb(MovieId: (sender as AnyObject).tag)
            }
        }
        
    }
    
}

