//
//  Movie.swift
//  movies-ios
//
//  Created by Galileo Guzman on 26/11/20.
//

import Foundation

struct Movie: Codable, Hashable {
    let popularity: Double
    let voteCount: Int
    let video: Bool
    let posterPath: String
    let id: Int
    let adult: Bool
    let backdropPath: String
    let originalLanguage: String
    let originalTitle: String
    let title: String
    let voteAverage: Double
    let overview: String
    let releaseDate: String
    
    func fullImage() -> String{
        return Environment.baseImageURL.absoluteString + self.posterPath
    }
}
