//
//  HomeMovieViewController+Search.swift
//  Movies
//
//  Created by Thiago Cavalcante de Oliveira on 19/01/19.
//  Copyright © 2019 Thiago Cavalcante de Oliveira. All rights reserved.
//

import UIKit

extension HomeMoviesViewController : UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        viewModel?.searchMovies(searchText)
    }
}
