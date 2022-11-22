//
//  File.swift
//  MovieApp
//
//  Created by Elif İlay KANDEMİR on 14.09.2022.
//

import Foundation
import UIKit

struct GenresModel:Decodable{
    var genres : [GenresData]
}

struct GenresData: Decodable,Searchable {
    func controlledSearhableText(text: String) -> Bool {
        guard let name = name else {return false}
        return name.contains(text)
    }
    
    var id : Int?
    var name : String?
    var image : String?
    
}

struct GenresImage {
    var image : UIImage
}
