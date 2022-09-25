//
//  PageSwipeController.swift
//  MovieApp
//
//  Created by Elif İlay KANDEMİR on 25.08.2022.
//

import UIKit

class PageSwipeController : UICollectionViewController,UICollectionViewDelegateFlowLayout{
    
    
    let imagesName = ["firstpage","secondpage","thirdpage"]
    
    lazy var exploreButton : UIButton = {
        let button = UIButton()
        button.setTitle("Explore Collection   >", for: .normal)
        button.titleLabel?.textColor = .white
        button.titleLabel?.textAlignment = .center
        button.backgroundColor = UIColor(named: "buttonblue")
        button.titleLabel?.font = UIFont(name: "AppleGothic", size: 22)
        button.titleLabel?.textAlignment = .center
        return button
    }()
    
    lazy var pageControl: UIPageControl = {
        var pageCont = UIPageControl()
        pageCont.currentPage = 0
        pageCont.numberOfPages = 3
        pageCont.currentPageIndicatorTintColor = UIColor(named: "buttonblue")
        pageCont.pageIndicatorTintColor = .white
        return pageCont
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupconstraint()
        collectionView.backgroundColor = .white
        collectionView.register(PageCell.self, forCellWithReuseIdentifier:"cellid")
        collectionView.isPagingEnabled = true
        exploreButton.addTarget(self, action: #selector(didTappedButton), for: .touchUpInside)
        
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
    
    func setupconstraint(){
        view.addSubview(exploreButton)
        view.addSubview(pageControl)
        exploreButton.addConstraint(top: view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: 720, paddingLeft: 50, paddingBottom: 120, paddingRight: 50, width: nil, height: nil,centerX: nil , centerY: nil)
        pageControl.addConstraint(top:view.topAnchor,left:nil , bottom: view.bottomAnchor, right: nil, paddingTop: 763, paddingLeft: 0, paddingBottom: 24, paddingRight: 0, width: nil, height: nil, centerX:view.centerXAnchor, centerY: view.centerYAnchor)
    }
    
    override func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let x = targetContentOffset.pointee.x
        print(x,view.frame.width,x/view.frame.width)
        pageControl.currentPage = Int(x/view.frame.width)
    }
}
