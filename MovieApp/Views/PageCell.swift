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

    lazy var pageTitle = Label(labelText: "Movies & Series", labelFontNamed: "AppleGothic", labelFontSize: 40)
    
    let pageSubtitle = Label(labelText: "The world’s most popular and authoritative source for movies and series.", labelFontNamed: "AppleGothic", labelFontSize: 20)

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
        
        backroundImageView.addConstraint(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: nil, height:nil , centerX: nil, centerY: nil)
        pageTitle.addConstraint(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 350, paddingLeft: 0, paddingBottom: 480, paddingRight: 0, width: nil, height: nil, centerX: nil, centerY: nil)
        pageSubtitle.addConstraint(top: pageTitle.bottomAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop:4, paddingLeft:0, paddingBottom: 353, paddingRight: 0, width: nil, height: nil, centerX:nil , centerY: nil)
        
    }
}
