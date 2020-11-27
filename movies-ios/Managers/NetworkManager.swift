//
//  NetworkManager.swift
//  movies-ios
//
//  Created by Galileo Guzman on 26/11/20.
//


import UIKit

class NetworkManager {
    // Class
    static let shared = NetworkManager()
    let cache = NSCache<NSString, UIImage>()
    
    // API Calls
    private let BASE_URL = Environment.baseURL.absoluteString
    private let API_KEY = Environment.apiKey
    
    private init() {}
    
    func getPopularMovies(completed: @escaping(Result<PopularMovies, NetworkErrors>) -> Void ) {
        let endpoint = BASE_URL + "/3/movie/popular?api_key=" + API_KEY
        
        guard let url = URL(string: endpoint) else {
            completed(.failure(.unableToComplete))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let _ = error{
                completed(.failure(.unableToComplete))
                return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completed(.failure(.invalidResponse))
                return
            }
            
            guard let data = data else {
                completed(.failure(.invalidData))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let nowPlaying = try decoder.decode(PopularMovies.self, from: data)
                completed(.success(nowPlaying))
            } catch {
                completed(.failure(.invalidData))
            }
            
        }
        
        task.resume()
    }
    
}
