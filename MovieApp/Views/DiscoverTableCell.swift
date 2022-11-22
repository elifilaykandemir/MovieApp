//
//  DiscoverTableCell.swift
//  MovieApp
//
//  Created by Elif İlay KANDEMİR on 12.11.2022.
//

import UIKit

class DiscoverTableCell: UITableViewCell {

    static let identifier = "DiscoverTableCell"
    
    var rawData = [MoviesData]()
    var filteredData : [MoviesData] = []
    var imagenotFound = "/whNwkEQYWLFJA8ij0WyOOAD5xhQ.jpg"
    let imageUrl = "https://image.tmdb.org/t/p/original"
    let cache = NSCache<NSNumber, UIImage>()

    
    lazy var discoverCollectionView : UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: 170, height: 170)
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 10
        layout.sectionInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        let collectView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectView.translatesAutoresizingMaskIntoConstraints = false
        collectView.showsHorizontalScrollIndicator = false
        collectView.showsVerticalScrollIndicator = false
        
        return collectView
    }()
    
    func fetch(){

        NetworkManager.fetchGenericData(urlString: "\(NetworkManager.site)/discover/movie?api_key=\(NetworkManager.apiKey)&language=en-US&page=1&with_genres=28") { (moviesdata:DiscoverModel) in
            self.rawData = moviesdata.results
            print(self.rawData)
            self.filteredData = self.rawData
            print("\(NetworkManager.site)/discover/movie?api_key=\(NetworkManager.apiKey)&language=en-US&page=1&with_genres=28")

            DispatchQueue.main.async {
                self.discoverCollectionView.reloadData()
            }
        }
    }

    func setCollectionView(){
        contentView.addSubview(discoverCollectionView)
        setdelegate()
        discoverCollectionView.register(DiscoverCell.self, forCellWithReuseIdentifier:DiscoverCell.identifier)
        setupLayouts()
        
        
    }
    func setupLayouts(){
        discoverCollectionView.pin(to: contentView)
    }
    func setdelegate(){
        discoverCollectionView.dataSource = self
        discoverCollectionView.delegate = self
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        discoverCollectionView.frame = contentView.bounds
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setCollectionView()
        fetch()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension DiscoverTableCell: UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return filteredData.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DiscoverCell.identifier, for: indexPath) as! DiscoverCell
        cell.collectionCellStyle(moviesName:filteredData[indexPath.row].title)
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 140, height:200)
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        
        guard let cell = cell as? DiscoverCell else { return }
        
        let itemNumber = NSNumber(value: indexPath.item)
        
        if let cachedImage = self.cache.object(forKey: itemNumber) {
            
            print("Using a cached image for item: \(itemNumber)")
            cell.moviesImageView.image = cachedImage
            
        } else {
            NetworkManager.loadImage(artist: filteredData[indexPath.row].poster_path ?? self.imagenotFound,defaultImage: self.imageUrl) { [weak self] (image) in
                
                guard let self = self, let image = image else { return }
                
                cell.moviesImageView.image = image
                
                self.cache.setObject(image, forKey: itemNumber)
            }
        }
    }
}


