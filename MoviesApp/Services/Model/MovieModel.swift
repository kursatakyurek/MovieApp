//
//  MovieModel.swift
//  MoviesApp
//
//  Created by Kürşat Akyürek on 7.08.2023.
//

import Foundation

struct MovieModel: Codable{
    let results: [Movie]
}

struct Movie: Codable{
    let title: String
    let overView: String
    let posterPath: String
    let date: String
    var movieImage: String{
        return "https://image.tmdb.org/t/p/w500/\(posterPath)"
    }
    let voteAverage: Double
    
    enum CodingKeys: String, CodingKey{
        case title
        case overView = "overview"
        case posterPath = "poster_path"
        case voteAverage = "vote_average"
        case date = "release_date"
    }
}
