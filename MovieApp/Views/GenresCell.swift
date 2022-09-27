//
//  GenresCell.swift
//  MovieApp
//
//  Created by Elif İlay KANDEMİR on 13.09.2022.
//

import UIKit

class GenresCell: UITableViewCell {
    
    lazy var genresImageView = UIImageView()
    
    
    func cellStyle(index:Int,genresTitleName:[String],genres:[GenresImage]){
        let genre = genres[index]
        self.setImage(genres: genre)
        self.genresTitleLabel.text = genresTitleName[index]
        self.layer.borderColor = UIColor.white.cgColor
        self.layer.borderWidth = 2.0
        self.layer.masksToBounds = true
        
    }
    
    lazy var genresTitleLabel : UILabel = {
        var label = UILabel()
        label.backgroundColor = UIColor(named: "verylightgray")?.withAlphaComponent(0.5)
        label.font = UIFont(name: "AppleGothic", size: 22)
        return label
    }()
    
    

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(genresImageView)
        addSubview(genresTitleLabel)

        setConstraints()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setImage(genres:GenresImage){
        genresImageView.image = genres.image
        
    }
 
    func setConstraints(){
        genresImageView.addConstraint(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: nil, height: nil, centerX: nil, centerY: nil)
        genresTitleLabel.addConstraint(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 125, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: nil, height: nil, centerX: nil, centerY: nil)

    }
}
