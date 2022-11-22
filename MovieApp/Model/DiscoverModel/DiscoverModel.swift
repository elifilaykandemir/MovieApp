//
//  DiscoverModel.swift
//  MovieApp
//
//  Created by Elif İlay KANDEMİR on 12.11.2022.
//

import Foundation



struct DiscoverModel:Decodable{
    var page : Int?
    var results : [MoviesData]
    
}

struct MoviesData: Decodable,Searchable {
    func controlledSearhableText(text: String) -> Bool {
        guard let name = title else {return false}
        return name.contains(text)
    }
    
    var release_date : String?
    var title : String?
    var backdrop_path : String?
    var poster_path : String?
    var popularity : Float?
}


