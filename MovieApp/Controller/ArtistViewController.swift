//
//  ArtistViewController.swift
//  MovieApp
//
//  Created by Elif İlay KANDEMİR on 30.08.2022.
//

import UIKit

class ArtistViewController: SearchController {

    

    var artistData = [PopularArtistsData]()
    var artistNames = [String]()
    var artistImages = [String]()
    var filteredData : [String] = []
    var imagenotFound = "/whNwkEQYWLFJA8ij0WyOOAD5xhQ.jpg" 
    let imageUrl = "https://image.tmdb.org/t/p/original"
    let cache = NSCache<NSNumber, UIImage>()


    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        searchBar.delegate = self
        showSearchBarButton(show: true)
        setCollectionView()
        
        fetchPapularArtistsData()
    }
    
   let artistsCell = "ArtistsCell"
    

    func fetchPapularArtistsData(){
        
        NetworkManager.fetchGenericData(urlString: "\(NetworkManager.site)/person/popular?api_key=\(NetworkManager.apiKey)&language=en-US&page=1&language=en-US&page=1") { (artistdata:PopularArtistsModel) in
            self.artistData = artistdata.results
            print("")
            for i in 0 ..< self.artistData.count{
                self.artistNames.append(self.artistData[i].name!)
                if let imagedata = self.artistData[i].profile_path {
                    self.artistImages.append(imagedata)
                } else {self.artistImages.append(self.imagenotFound)}
                
            }
            self.filteredData = self.artistNames
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
            
        }
    }

        private lazy var collectionView : UICollectionView = {
            let layout = UICollectionViewFlowLayout()
            layout.minimumLineSpacing = 10
            layout.minimumInteritemSpacing = 10
            layout.sectionInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
            let collectView = UICollectionView(frame: .zero, collectionViewLayout: layout)
            collectView.translatesAutoresizingMaskIntoConstraints = false
            collectView.backgroundColor = UIColor(named: "verylightgray")
            
            return collectView
        }()

    func setCollectionView(){
        setdelegate()
        collectionView.register(ArtistsCell.self, forCellWithReuseIdentifier:artistsCell)
        view.addSubview(collectionView)
        setupLayouts()


    }
    func setupLayouts(){
        collectionView.pin(to: view)
    }
    func setdelegate(){
        collectionView.dataSource = self
        collectionView.delegate = self
    }
    
}

extension ArtistViewController:UICollectionViewDataSource,UICollectionViewDelegateFlowLayout,UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return filteredData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: artistsCell, for: indexPath) as! ArtistsCell
        cell.collectionCellStyle(artistTitleName: filteredData[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout CollectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
       return CGSize(width: 111, height:160)
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        
        guard let cell = cell as? ArtistsCell else { return }
        
        let itemNumber = NSNumber(value: indexPath.item)
        
        if let cachedImage = self.cache.object(forKey: itemNumber) {
            print("Using a cached image for item: \(itemNumber)")
            cell.artistsImageView.image = cachedImage
        } else {
            NetworkManager.loadImage(artist: artistImages[indexPath.row],defaultImage: self.imageUrl) { [weak self] (image) in
                
                guard let self = self, let image = image else { return }
                
                cell.artistsImageView.image = image
                
                self.cache.setObject(image, forKey: itemNumber)
            }
        }
    }
    
}

extension ArtistViewController : UISearchBarDelegate {
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        search(shouldshow: false)
    }
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        filteredData = searchText.isEmpty ? artistNames : artistNames.filter {(item:String) -> Bool in
            return item.range(of: searchText , options: .caseInsensitive , range: nil , locale: nil) != nil
        }
        collectionView.reloadData()
    }
    }
