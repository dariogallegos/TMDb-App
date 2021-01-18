//
//  Constants.swift
//  TMDBApp
//
//  Created by Dario Gallegos on 16/1/21.
//

import Foundation

struct Constants {
    
    static let apiKey = "?api_key=80bfea38223ef3a16c3513513d464053"
    
    struct URL {
        static let main = "https://api.themoviedb.org/"
        static let urlImages = "https://image.tmdb.org/t/p/w200"
    }
    
    struct Endpoints {
        static let urlListPopularMovies = "3/movie/popular"
        static let urlDetailMovie = "3/movie/"
    }
    
}
