//
//  GenresCell.swift
//  MovieApp
//
//  Created by Elif İlay KANDEMİR on 13.09.2022.
//

import UIKit

class GenresCell: UITableViewCell {
    
    lazy var genresImageView = UIImageView()
    
    
    func cellStyle(index:Int,genresTitleName:[GenresData],genres:[GenresImage]){
        let genre = genres[index]
        self.setImage(genres: genre)
        self.genresTitleLabel.text = genresTitleName[index].name
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

        //configureTitleView()
        setImageConstraints()
        setLabelConstraints()

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setImage(genres:GenresImage){
        genresImageView.image = genres.image
        
    }
 
    

    //TODO:Create function for constraint
    func setImageConstraints(){
        genresImageView.translatesAutoresizingMaskIntoConstraints = false
        genresImageView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        genresImageView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        genresImageView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        genresImageView.topAnchor.constraint(equalTo: topAnchor).isActive = true
    }
    
    func setLabelConstraints(){
        genresTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        genresTitleLabel.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        genresTitleLabel.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        genresTitleLabel.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        genresTitleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 125).isActive = true
    }
}
