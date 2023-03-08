////
////  ArtistDetailsViewController.swift
////  MovieApp
////
////  Created by Elif İlay KANDEMİR on 20.10.2022.
////
//
//import UIKit
//
//class ArtistDetailsViewController: UIViewController,UICollectionViewDataSource,UICollectionViewDelegate{
//    
//    var imagenotFound = "/whNwkEQYWLFJA8ij0WyOOAD5xhQ.jpg"
//    let imageUrl = "https://image.tmdb.org/t/p/original"
//    let cache = NSCache<NSNumber, UIImage>()
//    var artistBiography = Label(labelText: "", labelFontNamed: "AppleGothic", labelFontSize: 14)
//    var artistName = ""
//    var birthday = ""
//    var knownforDepartman = ""
//    var contentSmallHeight : CGFloat = 0
//    var contentBigHeight : CGFloat = 0
//    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: ArtistDetailsViewController.createLayout())
//    static var totalPhoto: Int = 0
//    var rawData = [ArtistDetailImages]()
//    
//    lazy var segmentedController:UISegmentedControl = {
//        let sc = UISegmentedControl(items: ["Summary","Movies"])
//        sc.addTarget(self, action: #selector(segmentAction(_:)), for: .valueChanged)
//        sc.selectedSegmentIndex = 0
//        
//        return sc
//    }()
//    
//    func displaySummmary(){
//        if segmentedController.selectedSegmentIndex == 0{
//            view.addSubview(artistBiography)
//            artistBiography.textColor = .black
//            artistBiography.textAlignment = .left
//            artistBiography.addConstraint(top: segmentedController.bottomAnchor, left:view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom:0 , paddingRight: 0, width: nil, height: nil, centerX: nil, centerY: nil)
//        }
//        
//    }
//    
//    @objc func segmentAction(_ segmentedControl: UISegmentedControl) {
//        switch (segmentedControl.selectedSegmentIndex) {
//        case 0:
//            artistBiography.isHidden = false
//            
//        case 1:
//            artistBiography.isHidden = true
//        default:
//            break
//        }
//    }
// 
//    override func viewDidLoad(){
//        super.viewDidLoad()
//        
//        setCollectionView()
//        fetchPopularArtistsData()
//        view.addSubview(segmentedController)
//        displaySummmary()
//    }
//    
//    func fetchPopularArtistsData(){
//        
//        NetworkManager.fetchGenericData(urlString: "\(NetworkManager.site)/person/\(ArtistViewController.chosenArtist)/images?api_key=\(NetworkManager.apiKey)") { (artistimagedata:ArtistDetailed) in
//            
//            self.rawData = artistimagedata.profiles
//            ArtistDetailsViewController.totalPhoto = self.rawData.count
//            
//            DispatchQueue.main.async {
//                self.collectionView.reloadData()
//            }
//        }
//        
//        NetworkManager.fetchGenericData(urlString: "\(NetworkManager.site)/person/\(ArtistViewController.chosenArtist)?api_key=\(NetworkManager.apiKey)") { (artistdata:ArtistInformation) in
//            
//            self.artistBiography.text = artistdata.biography!
//            self.birthday = artistdata.birthday!
//            
//            self.artistName = artistdata.name!
//            self.knownforDepartman = artistdata.known_for_department!
//            
//            DispatchQueue.main.async {
//                self.collectionView.reloadData()
//            }
//        }
//    }
//    
//    func setCollectionView(){
//        
//        view.addSubview(collectionView)
//        collectionView.register(ArtistDetailsCell.self, forCellWithReuseIdentifier: ArtistDetailsCell.identifier)
//        collectionView.contentInsetAdjustmentBehavior = .never
//        collectionView.frame = view.bounds
//        
//        setdelegate()
//        
// }
//    
//    func setdelegate(){
//        collectionView.dataSource = self
//        collectionView.delegate = self
//    }
//    
//    static func createLayout()->UICollectionViewCompositionalLayout{
//        //item
//        let item = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(3/4)))
//        
//        let pairItem = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1/3), heightDimension: .fractionalHeight(1)))
//        
//        
//        let leadingGroup = NSCollectionLayoutGroup.horizontal(layoutSize:NSCollectionLayoutSize(widthDimension: .fractionalWidth(2/3), heightDimension: .fractionalHeight(1)) , subitem:pairItem,count:2)
//        
//        let verticalPairItem = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1/2)))
//        
//        
//        let trailingGroup = NSCollectionLayoutGroup.vertical(layoutSize:NSCollectionLayoutSize(widthDimension: .fractionalWidth(1/3), heightDimension: .fractionalHeight(1)) , subitem:verticalPairItem,count:2)
//        
//        //group
//        
//        let verticalTrailingGroup = NSCollectionLayoutGroup.horizontal(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1/3), heightDimension: .fractionalHeight(1)),subitem:trailingGroup,count: 2)
//        
//        let horizontalGroup = NSCollectionLayoutGroup.horizontal(layoutSize:NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalWidth(1/4)) , subitems: [leadingGroup,verticalTrailingGroup])
//        
//        let group = NSCollectionLayoutGroup.vertical(layoutSize:NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1/2)), subitems: [item,horizontalGroup,horizontalGroup])
//        
//        //section
//        let section = NSCollectionLayoutSection(group:group )
//        
//        
//        //return
//        return UICollectionViewCompositionalLayout(section: section)
//    }
//    
//    
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return 7
//    }
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ArtistDetailsCell.identifier, for: indexPath) as! ArtistDetailsCell
//        
//        cell.setImage(with:rawData[safe:indexPath.row]?.file_path)
//        
//        if indexPath.item == 0 {
//            cell.collectionCellStyle(artistName: artistName, artistBirthday: birthday, knownas: knownforDepartman)
//            cell.setupLayoutContent()
//            contentBigHeight = cell.contentView.bounds.height
//            
//            
//        }
//        if indexPath.item == 1{
//            cell.setupContent()
//            contentSmallHeight = cell.contentView.bounds.height
//            
//        }
//        segmentedController.frame = CGRect(x: 0, y:(contentBigHeight+contentSmallHeight), width: view.frame.width, height: 50)
//        return cell
//    }
//    
//    
//}
//
//extension Collection {
//
//    public subscript(safe index: Index) -> Iterator.Element? {
//
//        return index >= startIndex && index < endIndex ? self[index] : nil
//
//    }
//
//}
