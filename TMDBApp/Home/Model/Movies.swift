//
//  Movie.swift
//  TMDBApp
//
//  Created by Dario Gallegos on 16/1/21.
//

import Foundation

struct Movies:Codable {
    let results: [Movie]
}

struct Movie: Codable, Identifiable {
    var id = UUID()
    let title: String
    let popularity: Double
    let movieID: Int
    let voteCount: Int
    let originalTitle: String
    let sinopsis: String
    let releaseDate: String
    let image: String
    let voteAverage: Double
    
    enum CodingKeys: String, CodingKey {
        case title
        case popularity
        case movieID = "id"
        case voteCount = "vote_count"
        case originalTitle = "original_title"
        case sinopsis = "overview"
        case releaseDate = "release_date"
        case image = "poster_path"
        case voteAverage = "vote_average"
    }
}
