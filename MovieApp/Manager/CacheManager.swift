//
//  CasheManager.swift
//  MovieApp
//
//  Created by Elif İlay KANDEMİR on 19.10.2022.
//

import UIKit

class CacheManager {
    
    let cache = NSCache<NSString, UIImage>()
    static let sharedInstance = CacheManager()
    var imagenotFound = "/whNwkEQYWLFJA8ij0WyOOAD5xhQ.jpg"
    let imageUrl = "https://image.tmdb.org/t/p/original"
    
    func getImage(imageAdress:String?,completion: @escaping (UIImage?) -> ()){
        
        if let imageAdress = imageAdress,let cachedImage = self.cache.object(forKey: NSString(string: imageAdress)) {
            print("Using a cached image for item: \(imageAdress)")
            completion(cachedImage)
        } else {
            NetworkManager.loadImage(artist:imageAdress ?? self.imagenotFound,defaultImage: self.imageUrl) { [weak self] (image) in
                
                guard let self = self, let image = image, let imageAdress = imageAdress else { return }
                
                completion(image)
                
                self.cache.setObject(image, forKey:NSString(string: imageAdress))
            }
        }
    }
}

