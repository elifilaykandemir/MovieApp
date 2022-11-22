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

struct PopularArtistsData: Decodable,Searchable {
    func controlledSearhableText(text: String) -> Bool {
        guard let name = name else {return false}
        return name.contains(text)
    }
    
    var id : Int?
    var name : String?
    var profile_path : String?
}

struct ArtistDetailed: Decodable {
    var id : Int?
    var profiles : [ArtistDetailImages]
    
}

struct ArtistDetailImages: Decodable {
    var file_path: String?
}

struct ArtistInformation: Decodable {
    var biography: String?
    var birthday: String?
    var name: String?
    var known_for_department:String?
}

protocol Searchable{
    
    func controlledSearhableText(text:String) -> Bool
      
    
}
