//
//  CasheManager.swift
//  MovieApp
//
//  Created by Elif İlay KANDEMİR on 19.10.2022.
//

import UIKit

class CacheManager {
    
    let cache = NSCache<NSNumber, UIImage>()
    static let sharedInstance = CacheManager()
    
}
