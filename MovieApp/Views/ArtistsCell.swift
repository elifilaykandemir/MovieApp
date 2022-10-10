//
//  ArtistsCell.swift
//  MovieApp
//
//  Created by Elif İlay KANDEMİR on 28.09.2022.
//

import UIKit

class ArtistsCell: UICollectionViewCell {

    var artistsImageView = UIImageView()
    
    lazy var artistTitleLabel : UILabel = {
        var label = UILabel()
        label.backgroundColor = UIColor(named: "white")?.withAlphaComponent(0.5)
        label.font = UIFont(name: "AppleGothic", size: 14)
        label.backgroundColor = .white
        label.textAlignment = .center
        return label
    }()
    
    func collectionCellStyle(artistTitleName:String){
        self.artistTitleLabel.text = artistTitleName
       
        
    }
    override init(frame:CGRect){
        super.init(frame:frame)
        self.contentView.addSubview(artistsImageView)
        self.contentView.addSubview(artistTitleLabel)
        setConstraints()
    
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
            super.prepareForReuse()
            
            self.artistsImageView.image = nil
        }
    
    func setImage(with artist:String){
        artistsImageView.image = UIImage(named: artist)
        
    }
    
    func setConstraints(){
        artistsImageView.addConstraint(top:contentView.topAnchor, left: contentView.leftAnchor, bottom: contentView.bottomAnchor, right: contentView.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: nil, height: nil, centerX: nil, centerY: nil)
        artistTitleLabel.addConstraint(top: artistsImageView.topAnchor, left: contentView.leftAnchor, bottom: contentView.bottomAnchor, right: rightAnchor, paddingTop: 115, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: nil, height: nil, centerX: nil, centerY: nil)
        
    }
//    func loadImage(artistTitleName:String,artist:String,completion: @escaping (UIImage?) -> ()) {
//            utilityQueue.async {
//                let url = URL(string: "\(self.imageUrl)\(artist)")!
//                print(url)
//                guard let data = try? Data(contentsOf: url) else { return }
//                let image = UIImage(data: data)
//                print(image)
//                print(data)
//                DispatchQueue.main.async {
//                    completion(image)
//                }
//            }
//        }

}
   
//extension UIImageView {
//    func downloaded(from url: URL, contentMode mode: ContentMode = .scaleAspectFit) {
//        contentMode = mode
//        URLSession.shared.dataTask(with: url) { data, response, error in
//            guard
//                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
//                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
//                let data = data, error == nil,
//                let image = UIImage(data: data)
//                else { return }
//            print(image)
//            print(data)
//            DispatchQueue.main.async() { [weak self] in
//                self?.image = image
//                print(image)
//            }
//        }.resume()
//    }
//    func downloaded(from link: String, contentMode mode: ContentMode = .scaleAspectFit) {
//        guard let url = URL(string: link) else { return }
//        downloaded(from: url, contentMode: mode)
//    }
//}



