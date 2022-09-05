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
        //button.addTarget(self, action: #selector(didTappedButton), for: .touchUpInside)
        //button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let pageControl: UIPageControl = {
        var pageCont = UIPageControl()
        //pageCont.currentPage = 0
        pageCont.numberOfPages = 3
        pageCont.currentPageIndicatorTintColor = UIColor(named: "buttonblue")
        pageCont.pageIndicatorTintColor = .white
        pageCont.translatesAutoresizingMaskIntoConstraints = false
        return pageCont
    }()

    //var pagecell = PageCell()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = .white
        collectionView.register(PageCell.self, forCellWithReuseIdentifier:"cellid")
        collectionView.isPagingEnabled = true
        //navigationController?.hidesBarsOnTap = true
        //pagecell.exploreButton.addTarget(self, action: #selector(didTappedButton), for: .touchUpInside)
        
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
        exploreButton.topAnchor.constraint(equalTo: cell.topAnchor , constant: 720 ).isActive = true
        exploreButton.bottomAnchor.constraint(equalTo: cell.bottomAnchor , constant:-120).isActive = true
        exploreButton.leftAnchor.constraint(equalTo: cell.leftAnchor, constant: 50).isActive = true
        exploreButton.rightAnchor.constraint(equalTo: cell.rightAnchor, constant: -50).isActive = true
        cell.addSubview(pageControl)
        pageControl.topAnchor.constraint(equalTo: cell.topAnchor , constant: 763 ).isActive = true
        pageControl.bottomAnchor.constraint(equalTo: cell.bottomAnchor , constant:-24).isActive = true
        pageControl.centerXAnchor.constraint(equalTo: cell.centerXAnchor).isActive = true
        pageControl.centerYAnchor.constraint(equalTo: cell.centerYAnchor).isActive = true
        
        pageControl.currentPage = indexPath.item
        exploreButton.addTarget(self, action: #selector(didTappedButton), for: .touchUpInside)
        
        return cell
    
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imagesName.count
    }




    @objc func didTappedButton(){
        print("Button tapped")
        
        let rootVC = TabBarViewController().createTabBar()
        rootVC.modalPresentationStyle = .fullScreen
        present(rootVC, animated: true)

    }
    
}


