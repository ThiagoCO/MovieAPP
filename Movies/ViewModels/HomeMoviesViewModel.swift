//
//  HomeMoviesViewModel.swift
//  Movies
//
//  Created by Thiago Cavalcante de Oliveira on 13/01/19.
//  Copyright © 2019 Thiago Cavalcante de Oliveira. All rights reserved.
//

import Foundation

class HomeMoviesViewModel {
    
    //MARK: - Variables
    var view:MovieView
    var listMovies: ListMovies?
    var searchMoviesList: [Movie]?
    
    //MARK: - Functions
    init(view:MovieView) {
        self.view = view
        getMovieList()
    }
    
    func getMovieList() {
        view.startLoad()
        APIManager.shared.getPopularMovies { (listMovies) in
            self.listMovies = listMovies
            self.searchMoviesList = listMovies?.results
            self.view.stopLoad()
            self.view.reloadCollection()
        }
    }
    
    func getFavoriteMovie(idSelected:Int) -> Bool{
        let movieIsFavorite = MovieDAO().movieIsFavorite(id: idSelected)
        return movieIsFavorite
    }
    
    func saveFavoriteMovieDb(MovieId:Int) {
        if let listMovies = listMovies?.results {
            for movie in listMovies {
                if(movie.id == MovieId) {
                    MovieDAO().saveFavoriteMovie(movieModel: movie)
                }
            }
        }
    }
    
    func deleteFavoriteMovieDb(MovieId:Int) {
        MovieDAO().removeMovieFavorite(id: MovieId)
    }
    
    func searchMovies(_ searchText:String) {
        if(searchText.isEmpty) {
            guard let completeListMovie = searchMoviesList else { return }
            listMovies?.results = completeListMovie
        }
        else {
            listMovies?.results = searchMoviesList?.filter { $0.title.uppercased().contains(searchText.uppercased()) } ?? []
        }
        
        view.reloadCollection()
    }
}
