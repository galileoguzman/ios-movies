//
//  Environment.swift
//  movies-ios
//
//  Created by Galileo Guzman on 26/11/20.
//

import Foundation

public enum Environment {
    // MARK: - Keys
    enum Keys {
        enum Plist {
            static let baseURL = "BASE_URL"
            static let apiKey = "API_KEY"
            static let baseImageURL = "BASE_IMAGE_URL"
        }
    }
    
    // MARK: - Plist
    private static let infoDictionary: [String: Any] = {
        guard let dict = Bundle.main.infoDictionary else {
            fatalError("Plist file not found")
        }
        return dict
    }()
    
    // MARK: - Plist values
    static let baseURL: URL = {
        guard let rootURLstring = Environment.infoDictionary[Keys.Plist.baseURL] as? String else {
            fatalError("BASE_URL not set in plist for this environment")
        }
        guard let url = URL(string: rootURLstring) else {
            fatalError("BASE_URL not valid")
        }
        return url
    }()
    
    static let baseImageURL: URL = {
        guard let rootURLstring = Environment.infoDictionary[Keys.Plist.baseImageURL] as? String else {
            fatalError("BASE_IMAGE_URL not set in plist for this environment")
        }
        guard let url = URL(string: rootURLstring) else {
            fatalError("BASE_IMAGE_URL not valid")
        }
        return url
    }()
    
    static let apiKey: String = {
        guard let apiKey = Environment.infoDictionary[Keys.Plist.apiKey] as? String else {
            fatalError("API_KEY not set in plist for this environment")
        }
        return apiKey
    }()
}
