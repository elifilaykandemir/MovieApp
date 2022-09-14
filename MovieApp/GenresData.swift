//
//  File.swift
//  MovieApp
//
//  Created by Elif İlay KANDEMİR on 14.09.2022.
//

import Foundation

struct GenresData: Decodable {
    var id : Int
    var name : String
}

struct genresName:Decodable{
    var genres : [GenresData]
}
