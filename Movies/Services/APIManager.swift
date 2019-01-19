//
//  APIManager.swift
//  Movies
//
//  Created by Thiago Cavalcante de Oliveira on 12/01/19.
//  Copyright © 2019 Thiago Cavalcante de Oliveira. All rights reserved.
//

import Foundation
import Alamofire

class APIManager {
    
    static let shared = APIManager()
    var apiKey = "api_key=9e3858836bbc926d6a70d3a319d06330"
    
    func getPopularMovies(completed:@escaping(ListMovies?) -> Void) {
        Alamofire.request("https://api.themoviedb.org/3/movie/popular?\(apiKey)",method: .get).responseData{ (result) in
            if let data = result.data {
                 let movieList = try? JSONDecoder().decode(ListMovies.self, from: data)
                 completed(movieList)
            }
        }
    }
}
