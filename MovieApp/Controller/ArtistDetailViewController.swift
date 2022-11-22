////
////  ArtistDetailViewController.swift
////  MovieApp
////
////  Created by Elif İlay KANDEMİR on 30.10.2022.
////
//
//import UIKit
//
//class ArtistDetailViewController: UIViewController {
//    
//    var rawData = [String]()
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        view.backgroundColor = .white
//        setCollectionView()
//        
//        fetchPapularArtistsData()
//    }
//    
//
//    
//
//    func fetchPapularArtistsData(){
//        
////        NetworkManager.fetchGenericData(urlString: "\(NetworkManager.site)/person/popular?api_key=\(NetworkManager.apiKey)&language=en-US&page=1&language=en-US&page=1") { (artistdata:PopularArtistsModel) in
////            self.rawData = artistdata.results
////            self.filteredData = self.rawData
////            
////            DispatchQueue.main.async {
////                self.collectionView.reloadData()
////            }
////            
////        }
//    }
//
//        private lazy var collectionView : UICollectionView = {
//            let layout = UICollectionViewFlowLayout()
//            layout.minimumLineSpacing = 0
//            layout.minimumInteritemSpacing = 0
//            //layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
//            let collectView = UICollectionView(frame: .zero, collectionViewLayout: layout)
//            collectView.translatesAutoresizingMaskIntoConstraints = false
//            collectView.backgroundColor = UIColor(named: "verylightgray")
//            collectView.contentInsetAdjustmentBehavior = .never
//            
//            return collectView
//        }()
//
//    
//    func setCollectionView(){
//        setdelegate()
//        collectionView.register(ArtistDetailsCell.self, forCellWithReuseIdentifier:ArtistDetailsCell.identifier)
//        view.addSubview(collectionView)
//        setupLayouts()
//
//
//    }
//    func setupLayouts(){
//        collectionView.pin(to: view)
//    }
//    func setdelegate(){
//        collectionView.dataSource = self
//        collectionView.delegate = self
//        
//    }
//    
//    
//}
//
//
//
//extension ArtistDetailViewController:UICollectionViewDataSource,UICollectionViewDelegateFlowLayout,UICollectionViewDelegate {
//    
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        
//        return 4
//    }
//
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ArtistDetailsCell.identifier, for: indexPath) as! ArtistDetailsCell
//        
//        return cell
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, layout CollectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        if indexPath.item == 0 {
//            return CGSize(width: collectionView.bounds.width, height:(collectionView.bounds.height)/3)
//        }
//        else if indexPath.item == 1 || indexPath.item == 2 {
//            
//            return CGSize(width: (collectionView.bounds.width) / 3, height:(collectionView.bounds.width)/3)
//        }
//        else {
//           
//            return CGSize(width: (collectionView.bounds.width)/6,height:(collectionView.bounds.width)/6)
//        }
//    }
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        let vc = ArtistDetailViewController()
//        vc.modalPresentationStyle = .fullScreen
//        present(vc, animated: true)
//    }
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
//        return 0
//    }
//    
//
//    
//    // Cell Margin
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
//        return .zero
//        
//    }
//    
//}
//        
//        //    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
//        //
//        //        guard let cell = cell as? ArtistsCell else { return }
//        //
//        //        let itemNumber = NSNumber(value: indexPath.item)
//        //
//        //        if let cachedImage = self.cache.object(forKey: itemNumber) {
//        //            print("Using a cached image for item: \(itemNumber)")
//        //            cell.artistsImageView.image = cachedImage
//        //        } else {
//        //            NetworkManager.loadImage(artist: filteredData[indexPath.row].profile_path ?? self.imagenotFound,defaultImage: self.imageUrl) { [weak self] (image) in
//        //
//        //                guard let self = self, let image = image else { return }
//        //
//        //                cell.artistsImageView.image = image
//        //
//        //                self.cache.setObject(image, forKey: itemNumber)
//        //            }
//        //        }
//        //    }
//
//
