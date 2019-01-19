//
//  HomeMoviesViewController+CollectionView.swift
//  Movies
//
//  Created by Thiago Cavalcante de Oliveira on 12/01/19.
//  Copyright © 2019 Thiago Cavalcante de Oliveira. All rights reserved.
//

import UIKit

extension HomeMoviesViewController: UICollectionViewDelegate, UICollectionViewDataSource {
  
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel?.listMovies?.results.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! MoviesCell
        if let listGames = viewModel?.listMovies {
            let urlImg = "https://image.tmdb.org/t/p/w500/\(listGames.results[indexPath.row].posterImg)"
            var movieFavorite = viewModel?.getFavoriteMovie(idSelected: listGames.results[indexPath.row].id)
            cell.configMovieCell(name: listGames.results[indexPath.row].title, img: urlImg, favorite: movieFavorite ?? false)
            cell.buttonFavorite.tag = listGames.results[indexPath.row].id
            
        }
        return cell
    }
    
   
    
    
}
