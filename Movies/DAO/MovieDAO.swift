//
//  AlunoDAO.swift
//  Movies
//
//  Created by Thiago Cavalcante de Oliveira on 14/01/19.
//  Copyright © 2019 Thiago Cavalcante de Oliveira. All rights reserved.
//

import UIKit
import CoreData

class MovieDAO: NSObject {
    var managerDAO:NSFetchedResultsController<MovieFavoriteDb>?
    
    var context:NSManagedObjectContext {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        return appDelegate.persistentContainer.viewContext
    }
    
    func saveFavoriteMovie(movieModel:Movie){
        
        var movie:NSManagedObject?
        
        let entity = NSEntityDescription.entity(forEntityName: "MovieFavoriteDb", in: context)
        movie = NSManagedObject(entity: entity!, insertInto: context)
        
        movie?.setValue(movieModel.id, forKey: "id")
        movie?.setValue(movieModel.title, forKey: "title")
        movie?.setValue(movieModel.date, forKey: "dateMovie")
        movie?.setValue(movieModel.posterImg, forKey: "posterImg")
        movie?.setValue(movieModel.description, forKey: "descriptionMovie")
        movie?.setValue(movieModel.listGenre, forKey: "listGenre")
        movie?.setValue(movieModel.voteAverage, forKey: "voteAverage")
        movie?.setValue(movieModel.voteCount, forKey: "voteCount")
        movie?.setValue(false, forKey: "favorite")
        
        do {
            try context.save()
        }catch{
            print(error.localizedDescription)
        }
    }
    
    func movieIsFavorite(id:Int) -> Bool {
        
        let searchMovie:NSFetchRequest<MovieFavoriteDb> = MovieFavoriteDb.fetchRequest()
        
        do{
            let result = try context.fetch(searchMovie)
            for movie in result {
                if(movie.id == id){
                    return true
                }
            }
            
        }catch {
            print("fail")
        }
       return false
    }
    
    func getMovieDb(_ id:Int) -> MovieFavoriteDb? {
        let searchMovie:NSFetchRequest<MovieFavoriteDb> = MovieFavoriteDb.fetchRequest()
        
        do{
            let result = try context.fetch(searchMovie)
            for movie in result {
                if(movie.id == id){
                    return movie
                }
            }
            
        }catch {
            print("fail")
        }
        return nil

    }
    
    func removeMovieFavorite(id:Int){
        let movieDeleted = getMovieDb(id)
        if let movie = movieDeleted {
            context.delete(movie)
        }
        do {
            try context.save()
        }catch{
            print(error.localizedDescription)
        }
    }
    
}
