//
//  NetworkManager.swift
//  MovieApp
//
//  Created by Elif İlay KANDEMİR on 19.09.2022.
//

import Foundation

class NetworkManager{
    
    static let apiKey : String = "dc190303aea87bdf6e4faa3d59de8c59"
    static var site : String = "https://api.themoviedb.org"
    
    static func fetchGenericData<T: Decodable>(urlString:String,completion: @escaping (T)->()){
        
        
        guard let url = URL(string: urlString) else {return}
        
        let session = URLSession(configuration: .default)
        
        let task = session.dataTask(with: url){(data,response,error) in
            
            
            guard let safeData = data else { return }
 
            do{
                
                let decodedData = try JSONDecoder().decode(T.self, from: safeData)
                completion(decodedData)
                
            }catch let error{
                print("Failed to decode json:",error)
            }
        }
        task.resume()
    }
    
}

