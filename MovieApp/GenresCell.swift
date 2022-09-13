//
//  GenresCell.swift
//  MovieApp
//
//  Created by Elif İlay KANDEMİR on 13.09.2022.
//

import UIKit

class GenresCell: UITableViewCell {
    
    var genresImageView = UIImageView()
    var genresTitleLabel = UILabel()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(genresImageView)
        addSubview(genresTitleLabel)
        configureTitleView()
        setImageConstraints()
        setLabelConstraints()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(genres:Genres){
        genresImageView.image = genres.image
        genresTitleLabel.text = genres.title
        
    }
 
    
    func configureTitleView(){
        genresTitleLabel.backgroundColor = UIColor(named: "verylightgray")?.withAlphaComponent(0.5)
        genresTitleLabel.font = UIFont(name: "AppleGothic", size: 22)
        
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
