//
//  ArtistViewController.swift
//  MovieApp
//
//  Created by Elif İlay KANDEMİR on 30.08.2022.
//

import UIKit

class ArtistViewController: SearchController<PopularArtistsData> {

    


    static var chosenArtist : Int = 0
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
            self.rawData = artistdata.results
            self.filteredData = self.rawData
            
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
    
    override func reloadViewData() {
        collectionView.reloadData()
    }
    
}

extension ArtistViewController:UICollectionViewDataSource,UICollectionViewDelegateFlowLayout,UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return filteredData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: artistsCell, for: indexPath) as! ArtistsCell
        cell.collectionCellStyle(artistTitleName: filteredData[indexPath.row].name)
        cell.setImage(with:filteredData[indexPath.row].profile_path)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout CollectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
       return CGSize(width: 111, height:160)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        ArtistViewController.chosenArtist = filteredData[indexPath.row].id!
        let vc = ArtistDetailsViewController()
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
    }
    
 
    
}


