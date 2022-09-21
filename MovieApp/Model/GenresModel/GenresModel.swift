//
//  File.swift
//  MovieApp
//
//  Created by Elif İlay KANDEMİR on 14.09.2022.
//

import Foundation

struct GenresModel:Decodable{
    var genres : [GenresData]
}

struct GenresData: Decodable {
    var id : Int
    var name : String
}
