//
//  GenresManager.swift
//  MovieApp
//
//  Created by Elif İlay KANDEMİR on 14.09.2022.
//

import Foundation

struct GenresManager{
    let genresURL =
    "https://api.themoviedb.org/3/genre/movie/list?api_key=dc190303aea87bdf6e4faa3d59de8c59"
    
    func fetchdata(){
        performRequest(urlString: genresURL)
    }
    
    func performRequest(urlString:String){
        
        if let url = URL(string: urlString){
            
            let session = URLSession(configuration: .default)
            
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    print(error!)
                    return
                }
                if let safeData = data {
                    self.parseJSON(genresData:safeData)
                }
                    
            }
            task.resume()
        }
        }

    func parseJSON(genresData:Data){
        let decoder = JSONDecoder()
        do{
            let decodedData = try decoder.decode(genresName.self, from: genresData)
            let genres = decodedData.genres
        
            print(genres)
        }catch{
            print(error)
        }
  
}
}
