//
//  FavoriteMoviesViewController+TableView.swift
//  Movies
//
//  Created by Thiago Cavalcante de Oliveira on 20/01/19.
//  Copyright © 2019 Thiago Cavalcante de Oliveira. All rights reserved.
//

import UIKit

extension FavoriteMoviesViewController: UITableViewDelegate, UITableViewDataSource {
   
    func stepTableView() {
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.listMoviesDb?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellFavorite", for: indexPath) as! FavoriteMovieCell
        if let movieDb = viewModel?.listMoviesDb?[indexPath.row] {
            let urlimg = "https://image.tmdb.org/t/p/w500/\(viewModel?.listMoviesDb?[indexPath.row].posterImg ?? "")"
            if let url = URL(string: urlimg) {
                cell.configureCell(movie: movieDb , url: url)
            }
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            viewModel?.deleteFavoriteMovie(index: indexPath.row)
            self.tableView.reloadData()
        }
        
        
    }
    
}
