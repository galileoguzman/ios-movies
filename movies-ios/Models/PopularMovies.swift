//
//  PopularMovies.swift
//  movies-ios
//
//  Created by Galileo Guzman on 26/11/20.
//

import Foundation

struct PopularMovies: Codable {
    let page: Int
    let totalResults: Int
    let totalPages: Int
    let results: [Movie]
}
