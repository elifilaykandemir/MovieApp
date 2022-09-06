//
//  PageCell.swift
//  MovieApp
//
//  Created by Elif İlay KANDEMİR on 26.08.2022.
//

import UIKit

class PageCell : UICollectionViewCell{
    

    let backroundImageView : UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    lazy var pageTitle = UTextView(labelText: "Movies & Series", labelFontNamed: "AppleGothic", labelFontSize: 40)
    
    let pageSubtitle = UTextView(labelText: "The world’s most popular and authoritative source for movies and series.", labelFontNamed: "AppleGothic", labelFontSize: 20)

    override init(frame:CGRect){
        super.init(frame: frame)
        setupLayoutContent()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupLayoutContent(){
        
        addSubview(backroundImageView)
        addSubview(pageTitle)
        addSubview(pageSubtitle)
        
        let constraint = [
        backroundImageView.topAnchor.constraint(equalTo: topAnchor , constant: 0),
        backroundImageView.bottomAnchor.constraint(equalTo: bottomAnchor , constant:0 ),
        backroundImageView.leftAnchor.constraint(equalTo: leftAnchor, constant: 0),
        backroundImageView.rightAnchor.constraint(equalTo: rightAnchor, constant: 0),
        pageTitle.topAnchor.constraint(equalTo: topAnchor , constant: 350),
        pageTitle.bottomAnchor.constraint(equalTo:bottomAnchor , constant:-480),
        pageTitle.leftAnchor.constraint(equalTo: leftAnchor, constant: 0),
        pageTitle.rightAnchor.constraint(equalTo: rightAnchor, constant: 0),
        pageSubtitle.topAnchor.constraint(equalTo: pageTitle.bottomAnchor, constant:4 ),
        pageSubtitle.bottomAnchor.constraint(equalTo:bottomAnchor , constant:-353),
        pageSubtitle.leftAnchor.constraint(equalTo: leftAnchor, constant: 0),
        pageSubtitle.rightAnchor.constraint(equalTo: rightAnchor, constant: 0)
        ]
        NSLayoutConstraint.activate(constraint)
    }
}
