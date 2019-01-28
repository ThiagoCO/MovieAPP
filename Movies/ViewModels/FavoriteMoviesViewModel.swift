//
//  FavoriteMoviesViewModel.swift
//  Movies
//
//  Created by Thiago Cavalcante de Oliveira on 20/01/19.
//  Copyright © 2019 Thiago Cavalcante de Oliveira. All rights reserved.
//

import Foundation

class FavoriteMoviesViewModel {
    
    var listMoviesDb:[MovieFavoriteDb]?
    
    init(){
        getMoviesDb()
    }
    
    func getMoviesDb()   {
        listMoviesDb = MovieDAO().getMoviesFavoriteList()
    }
    
    func deleteFavoriteMovie(index:Int) {
        if let movieSelected = listMoviesDb?[index] {
            MovieDAO().removeMovieFavorite(id: Int(movieSelected.id))
            listMoviesDb?.remove(at: index)
        }
    }
}
