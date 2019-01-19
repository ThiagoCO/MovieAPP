//
//  Movie.swift
//  Movies
//
//  Created by Thiago Cavalcante de Oliveira on 12/01/19.
//  Copyright © 2019 Thiago Cavalcante de Oliveira. All rights reserved.
//

import Foundation

struct ListMovies: Codable {
    var results:[Movie]
    
}

struct Movie: Codable {
   
    enum CodingKeys: String, CodingKey {
        case voteCount = "vote_count"
        case id
        case voteAverage = "vote_average"
        case title
        case posterImg = "poster_path"
        case listGenre = "genre_ids"
        case description = "overview"
        case date = "release_date"
    }
    
    var voteCount:Int
    var id:Int
    var voteAverage:Double
    var title:String
    var posterImg:String
    var listGenre: [Int]
    var description: String
    var date: String
}

