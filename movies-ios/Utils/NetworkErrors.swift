//
//  NetworkErrors.swift
//  movies-ios
//
//  Created by Galileo Guzman on 26/11/20.
//

import Foundation

enum NetworkErrors: String, Error {
    case unableToComplete = "Unable to complete your request."
    case invalidResponse = "Invalid server response."
    case invalidData = "Invalid data."
}
