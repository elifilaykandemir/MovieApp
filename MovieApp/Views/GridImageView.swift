//
//  GridImageView.swift
//  MovieApp
//
//  Created by Elif İlay KANDEMİR on 15.12.2022.
//

import UIKit

class GridImageView:UIView{
    var imagenotFound = "/whNwkEQYWLFJA8ij0WyOOAD5xhQ.jpg"
    let imageUrl = "https://image.tmdb.org/t/p/original"
    let cache = NSCache<NSNumber, UIImage>()
    var artistBiography = Label(labelText: "", labelFontNamed: "AppleGothic", labelFontSize: 14)
    var artistName = ""
    var birthday = ""
    var knownforDepartman = ""
    static var totalPhoto: Int = 0
    var rawData = [ArtistDetailImages]()
    
    lazy var topImageView = BaseImageView()
    lazy var leftBigImageView = BaseImageView()
    lazy var rightBigImageView = BaseImageView()
    lazy var item1ImageView = BaseImageView()
    lazy var item2ImageView = BaseImageView()
    lazy var item3ImageView = BaseImageView()
    lazy var item4ImageView = BaseImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        fetchPopularArtistsData()
        setupConstraint()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func setupView(){
        self.addSubview(topImageView)
        self.addSubview(leftBigImageView)
        
        print("hahahahhshdshdhsabdhasbdhsabhdbsah")
        self.addSubview(rightBigImageView)
        self.addSubview(item1ImageView)
        self.addSubview(item2ImageView)
        self.addSubview(item3ImageView)
        self.addSubview(item4ImageView)
    }
    func setupConstraint(){
       
        topImageView.addConstraint(top:topAnchor, left: self.leftAnchor, bottom: bottomAnchor, right: self.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom:frame.height*1/3 , paddingRight: 0, width: frame.width, height: nil, centerX: nil, centerY: nil)
     
        leftBigImageView.addConstraint(top: topImageView.bottomAnchor, left:leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom:0 , paddingRight: frame.width*2/3, width: nil, height:nil, centerX: nil, centerY: nil)
        rightBigImageView.addConstraint(top: topImageView.bottomAnchor, left: leftBigImageView.rightAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom:0 , paddingRight: frame.width*1/3, width: nil, height: nil, centerX: nil, centerY: nil)
        item1ImageView.addConstraint(top: topImageView.bottomAnchor, left: rightBigImageView.rightAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom:frame.height*1/6, paddingRight: frame.width*1/6, width: nil, height:nil , centerX: nil, centerY: nil)
        item2ImageView.addConstraint(top: topImageView.bottomAnchor, left: item1ImageView.rightAnchor, bottom: bottomAnchor, right:rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom:frame.height*1/6 , paddingRight: 0, width: nil, height:nil , centerX: nil, centerY: nil)
        item3ImageView.addConstraint(top: item1ImageView.bottomAnchor, left: rightBigImageView.rightAnchor, bottom: bottomAnchor, right:rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom:0 , paddingRight: frame.height*1/6, width: nil, height:nil , centerX: nil, centerY: nil)
        item4ImageView.addConstraint(top: item2ImageView.bottomAnchor, left: item3ImageView.rightAnchor, bottom: bottomAnchor, right:rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom:0 , paddingRight: 0, width: nil, height:nil , centerX: nil, centerY: nil)
    }
    func setImage(with artist:String?,with artistImage:UIImageView){
        CacheManager.sharedInstance.getImage(imageAdress:artist , completion:{[weak self] image in
            DispatchQueue.main.async {
                artistImage.image = image
            }
        } )
        
    }
    func fetchPopularArtistsData(){
        
        NetworkManager.fetchGenericData(urlString: "\(NetworkManager.site)/person/\(ArtistViewController.chosenArtist)/images?api_key=\(NetworkManager.apiKey)") { (artistimagedata:ArtistDetailed) in
            
            self.rawData = artistimagedata.profiles
            GridImageView.totalPhoto = self.rawData.count
            self.setImage(with: self.rawData[0].file_path, with: self.topImageView)
            self.setImage(with: self.rawData[1].file_path, with: self.leftBigImageView)
            self.setImage(with: self.rawData[2].file_path, with: self.rightBigImageView)
            self.setImage(with: self.rawData[3].file_path, with: self.item1ImageView)
            self.setImage(with: self.rawData[4].file_path, with: self.item2ImageView)
            self.setImage(with: self.rawData[5].file_path, with: self.item3ImageView)
            self.setImage(with: self.rawData[6].file_path, with: self.item4ImageView)
            
            
        }
        
        NetworkManager.fetchGenericData(urlString: "\(NetworkManager.site)/person/\(ArtistViewController.chosenArtist)?api_key=\(NetworkManager.apiKey)") { (artistdata:ArtistInformation) in
            DispatchQueue.main.async {
                
                self.artistBiography.text = artistdata.biography!
                self.birthday = artistdata.birthday!
                
                self.artistName = artistdata.name!
                self.knownforDepartman = artistdata.known_for_department!
            }
         
            
            
        }
    }
}


class BaseImageView:UIImageView{
    
    init(with name :String?=nil) {
        super.init(image: UIImage(named: name ?? ""))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
