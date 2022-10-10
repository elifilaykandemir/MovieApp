//
//  File.swift
//  MovieApp
//
//  Created by Elif İlay KANDEMİR on 28.09.2022.
//

import Foundation

struct PopularArtistsModel:Decodable{
    var page : Int?
    var results : [PopularArtistsData]
    
}

struct PopularArtistsData: Decodable {
    var id : Int?
    var name : String?
    var profile_path : String?
}

struct ArtistDetailed: Decodable {
    
}
