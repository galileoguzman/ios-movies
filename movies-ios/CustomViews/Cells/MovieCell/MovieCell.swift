//
//  MovieCell.swift
//  movies-ios
//
//  Created by Galileo Guzman on 26/11/20.
//

import UIKit

class MovieCell: UICollectionViewCell {

    @IBOutlet weak var imgMovie: UIImageView!
    let cache = NetworkManager.shared.cache
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func downloadImage(from urlString: String) {
        
        let cacheKey = NSString(string: urlString)
        if let image = cache.object(forKey: cacheKey) {
            self.imgMovie.image = image
            return
        }
        
        guard let url = URL(string: urlString) else { return }
        
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
            guard let self = self else { return }
            if error != nil { return }
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else { return }
            guard let data = data else { return }
            
            guard let image = UIImage(data: data) else { return }
            
            self.cache.setObject(image, forKey: cacheKey)
            
            DispatchQueue.main.async {
                self.imgMovie.image = image
            }
        }
        
        task.resume()
    }

}
