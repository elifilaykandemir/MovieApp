//
//  ArtistDetailsCell.swift
//  MovieApp
//
//  Created by Elif İlay KANDEMİR on 20.10.2022.
//

import UIKit

class ArtistDetailsCell: UICollectionViewCell{
    
    static let identifier = "ArtistDetailsCell"
    
    var artistsDetailImageView = UIImageView()
    
    var artistTitle = Label(labelText:"" , labelFontNamed: "AppleGothic", labelFontSize: 25)
    
    var artistSubtitle = Label(labelText: "", labelFontNamed: "AppleGothic", labelFontSize: 17)
    
    var artistImageCount = Label(labelText: "", labelFontNamed: "AppleGothic", labelFontSize: 34)
    
    var artistSubImageCount = Label(labelText: "", labelFontNamed: "AppleGothic", labelFontSize: 17)
    
    func collectionCellStyle(artistName: String,artistBirthday:String,knownas:String){
    
        self.artistTitle = Label(labelText:artistName , labelFontNamed: "AppleGothic", labelFontSize: 37)
        artistTitle.textAlignment = .left
        print(artistTitle)
        
        self.artistSubtitle = Label(labelText: "\(knownas) | \(artistBirthday)", labelFontNamed: "AppleGothic", labelFontSize: 17)
        artistSubtitle.textAlignment = .left
        
    }
    override init(frame:CGRect){
        super.init(frame:frame)
        setupImageConstraints()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        self.artistsDetailImageView.image = nil
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        artistsDetailImageView.frame = contentView.frame
    }
    
    func setupImageConstraints(){
        contentView.addSubview(artistsDetailImageView)
        print(artistsDetailImageView)
        artistsDetailImageView.addConstraint(top:contentView.topAnchor, left: contentView.leftAnchor, bottom: contentView.bottomAnchor, right: contentView.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: nil, height: nil, centerX: nil, centerY: nil)
    }
    
    func imageLoader(_ imagePath:String,_ cachedImageData:UIImageView,_ defaultImage:String){
        let itemImage = NSString(string:imagePath)
        
        if let cachedImage = CacheManager.sharedInstance.cache.object(forKey: itemImage) {
            print("Using a cached image for item: \(itemImage)")
            
            cachedImageData.image = cachedImage
        } else {
            NetworkManager.loadImage(artist: imagePath,defaultImage: defaultImage) { [weak self] (image) in
                
                guard let image = image else { return }
                
                cachedImageData.image = image
                
                CacheManager.sharedInstance.cache.setObject(image, forKey: itemImage)
            }
        }
    }
    
    func setupLayoutContent(){
    
        contentView.addSubview(artistTitle)
        contentView.addSubview(artistSubtitle)
        
        artistTitle.addConstraint(top: artistsDetailImageView.topAnchor, left: contentView.leftAnchor, bottom: contentView.bottomAnchor, right: rightAnchor, paddingTop: 263, paddingLeft: 0, paddingBottom:35 , paddingRight: 0, width: nil, height: nil, centerX: nil, centerY: nil)
        artistSubtitle.addConstraint(top: artistTitle.bottomAnchor, left: contentView.leftAnchor, bottom: contentView.bottomAnchor, right: rightAnchor, paddingTop:4, paddingLeft:0, paddingBottom: 10, paddingRight: 0, width: nil, height: nil, centerX:nil , centerY: nil)

    }
    
    
    func setupContent(){
        
        contentView.addSubview(artistImageCount)
        contentView.addSubview(artistSubImageCount)
        artistImageCount.text = "+\(String(ArtistDetailsViewController.totalPhoto))"
        artistSubImageCount.text = "Photo Albums"
        
        artistImageCount.addConstraint(top: nil, left: nil, bottom: nil, right: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: nil, height: nil, centerX: contentView.centerXAnchor, centerY: contentView.centerYAnchor)
        
        
        artistSubImageCount.addConstraint(top: artistImageCount.bottomAnchor, left: contentView.leftAnchor, bottom: contentView.bottomAnchor, right: rightAnchor, paddingTop:1, paddingLeft:0, paddingBottom: 10, paddingRight: 0, width: nil, height: nil, centerX:nil , centerY: nil)
        
    }
    
}
