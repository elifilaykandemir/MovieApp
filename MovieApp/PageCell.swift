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

    
    let pageTitle = UTextView(labelText: "Movies & Series", labelFontNamed: "AppleGothic", labelFontSize: 40)
    
    let pageSubtitle = UTextView(labelText: "The world’s most popular and authoritative source for movies and series.", labelFontNamed: "AppleGothic", labelFontSize: 20)

//    let exploreButton : UIButton = {
//        let button = UIButton()
//        button.translatesAutoresizingMaskIntoConstraints = false
//        button.setTitle("Explore Collection   >", for: .normal)
//        //button.addTarget(self, action: #selector(didTappedButton), for: .touchUpInside)
//        //button.translatesAutoresizingMaskIntoConstraints = false
//        return button
//    }()
//    
//    let pageControl: UIPageControl = {
//        var pageCont = UIPageControl()
//        //pageCont.currentPage = 0
//        pageCont.numberOfPages = 3
//        pageCont.translatesAutoresizingMaskIntoConstraints = false
//        return pageCont
//    }()
//    
    override init(frame:CGRect){
        super.init(frame: frame)
        setupLayoutContent()
    
        //exploreButton.addTarget(self, action: #selector(didTappedButton), for: .touchUpInside)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupLayoutContent(){
        //backroundImageView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height:view.frame.height)
        addSubview(backroundImageView)
        backroundImageView.topAnchor.constraint(equalTo: topAnchor , constant: 0).isActive = true
        backroundImageView.bottomAnchor.constraint(equalTo: bottomAnchor , constant:0 ).isActive = true
        backroundImageView.leftAnchor.constraint(equalTo: leftAnchor, constant: 0).isActive = true
        backroundImageView.rightAnchor.constraint(equalTo: rightAnchor, constant: 0).isActive = true

        addSubview(pageTitle)
        pageTitle.topAnchor.constraint(equalTo: topAnchor , constant: 350).isActive = true
        pageTitle.bottomAnchor.constraint(equalTo:bottomAnchor , constant:-480).isActive = true
        pageTitle.leftAnchor.constraint(equalTo: leftAnchor, constant: 0).isActive = true
        pageTitle.rightAnchor.constraint(equalTo: rightAnchor, constant: 0).isActive = true

        addSubview(pageSubtitle)
        pageSubtitle.topAnchor.constraint(equalTo: pageTitle.bottomAnchor, constant:4 ).isActive = true
        pageSubtitle.bottomAnchor.constraint(equalTo:bottomAnchor , constant:-353).isActive = true
        pageSubtitle.leftAnchor.constraint(equalTo: leftAnchor, constant: 0).isActive = true
        pageSubtitle.rightAnchor.constraint(equalTo: rightAnchor, constant: 0).isActive = true


    }

  
    

}
