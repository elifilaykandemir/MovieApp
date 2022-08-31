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


    let pageSubtitle : UITextView = {
        let textView = UITextView()
        textView.text = "The world’s most popular and authoritative source for movies and series."
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.backgroundColor = UIColor.clear
        textView.isScrollEnabled = false
        return textView
    }()

    let pageTitle : UITextView = {
        let titleTextView = UITextView()
        titleTextView.text = "Movies & Series"
        titleTextView.translatesAutoresizingMaskIntoConstraints = false
        titleTextView.backgroundColor = UIColor.clear
        titleTextView.isScrollEnabled = false
        return titleTextView
    }()

    let exploreButton : UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Explore Collection   >", for: .normal)
        //button.addTarget(self, action: #selector(didTappedButton), for: .touchUpInside)
        //button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let pageControl: UIPageControl = {
        var pageCont = UIPageControl()
        //pageCont.currentPage = 0
        pageCont.numberOfPages = 3
        pageCont.translatesAutoresizingMaskIntoConstraints = false
        return pageCont
    }()
    
    override init(frame:CGRect){
        super.init(frame: frame)
        setupLayoutContent()
        styleUIContent()
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

        addSubview(exploreButton)
        //exploreButton.frame = CGRect(x:35, y:688, width: 305, height: 10)
        exploreButton.topAnchor.constraint(equalTo: topAnchor , constant: 720 ).isActive = true
        exploreButton.bottomAnchor.constraint(equalTo: bottomAnchor , constant:-120).isActive = true
        exploreButton.leftAnchor.constraint(equalTo: leftAnchor, constant: 50).isActive = true
        exploreButton.rightAnchor.constraint(equalTo: rightAnchor, constant: -50).isActive = true


        addSubview(pageControl)
        pageControl.topAnchor.constraint(equalTo: topAnchor , constant: 763 ).isActive = true
        pageControl.bottomAnchor.constraint(equalTo: bottomAnchor , constant:-24).isActive = true
        pageControl.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        pageControl.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true

    }

    private func styleUIContent(){
        //pageSubtitle.font = UIFont.boldSystemFont(ofSize: 17)
        pageSubtitle.font = UIFont(name: "AppleGothic", size: 20)
        pageSubtitle.textColor = .white
        pageSubtitle.textAlignment = .center
        pageSubtitle.isEditable = false

        pageTitle.font = UIFont(name: "AppleGothic", size: 40)
        pageTitle.textAlignment = .center
        pageTitle.textColor = .white
        pageTitle.isEditable = false

        exploreButton.titleLabel?.textColor = .white
        exploreButton.titleLabel?.textAlignment = .center
        exploreButton.backgroundColor = UIColor(named: "buttonblue")
        exploreButton.titleLabel?.font = UIFont(name: "AppleGothic", size: 22)
        exploreButton.titleLabel?.textAlignment = .center

        pageControl.currentPageIndicatorTintColor = UIColor(named: "buttonblue")
        pageControl.pageIndicatorTintColor = .white
    }
    

}
