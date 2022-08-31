//
//  PageSwipeController.swift
//  MovieApp
//
//  Created by Elif İlay KANDEMİR on 25.08.2022.
//

import UIKit

class PageSwipeController : UICollectionViewController,UICollectionViewDelegateFlowLayout{
    
    
    let imagesName = ["firstpage","secondpage","thirdpage"]
    

    var pagecell = PageCell()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = .white
        collectionView.register(PageCell.self, forCellWithReuseIdentifier:"cellid")
        collectionView.isPagingEnabled = true
        //navigationController?.hidesBarsOnTap = true
        pagecell.exploreButton.addTarget(self, action: #selector(didTappedButton), for: .touchUpInside)
        
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
        cell.pageControl.currentPage = indexPath.item
        cell.exploreButton.addTarget(self, action: #selector(didTappedButton), for: .touchUpInside)
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


