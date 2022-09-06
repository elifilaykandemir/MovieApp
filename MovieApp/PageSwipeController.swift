//
//  PageSwipeController.swift
//  MovieApp
//
//  Created by Elif İlay KANDEMİR on 25.08.2022.
//

import UIKit

class PageSwipeController : UICollectionViewController,UICollectionViewDelegateFlowLayout{
    
    
    let imagesName = ["firstpage","secondpage","thirdpage"]
    
    let exploreButton : UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Explore Collection   >", for: .normal)
        button.titleLabel?.textColor = .white
        button.titleLabel?.textAlignment = .center
        button.backgroundColor = UIColor(named: "buttonblue")
        button.titleLabel?.font = UIFont(name: "AppleGothic", size: 22)
        button.titleLabel?.textAlignment = .center
        return button
    }()
    
    let pageControl: UIPageControl = {
        var pageCont = UIPageControl()
        pageCont.currentPage = 0
        pageCont.numberOfPages = 3
        pageCont.currentPageIndicatorTintColor = UIColor(named: "buttonblue")
        pageCont.pageIndicatorTintColor = .white
        pageCont.translatesAutoresizingMaskIntoConstraints = false
        return pageCont
    }()

    

    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = .white
        collectionView.register(PageCell.self, forCellWithReuseIdentifier:"cellid")
        collectionView.isPagingEnabled = true
        
    }
    func collectionView(_ collectionView: UICollectionView, layout CollectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height:view.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellid", for: indexPath) as! PageCell
        let imageName = imagesName[indexPath.item]
        cell.backroundImageView.image = UIImage(named: imageName)
        cell.addSubview(exploreButton)
        cell.addSubview(pageControl)
        
        let constraint = [
            exploreButton.topAnchor.constraint(equalTo: cell.topAnchor , constant: 720 ),
            exploreButton.bottomAnchor.constraint(equalTo: cell.bottomAnchor , constant:-120),
            exploreButton.leftAnchor.constraint(equalTo: cell.leftAnchor, constant: 50),
            exploreButton.rightAnchor.constraint(equalTo: cell.rightAnchor, constant: -50),
            pageControl.topAnchor.constraint(equalTo: cell.topAnchor , constant: 763 ),
            pageControl.bottomAnchor.constraint(equalTo: cell.bottomAnchor , constant:-24),
            pageControl.centerXAnchor.constraint(equalTo: cell.centerXAnchor),
            pageControl.centerYAnchor.constraint(equalTo: cell.centerYAnchor)
       ]
        
        NSLayoutConstraint.activate(constraint)
        
        pageControl.currentPage = indexPath.item
        exploreButton.addTarget(self, action: #selector(didTappedButton), for: .touchUpInside)
        
        return cell
    
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imagesName.count
    }


    @objc func didTappedButton(){
        print("Button tapped")
        let rootVC = TabBarViewController()
        rootVC.modalPresentationStyle = .fullScreen
        present(rootVC, animated: true)

    }
    
}


