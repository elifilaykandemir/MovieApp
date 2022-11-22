//
//  DiscoverCell.swift
//  MovieApp
//
//  Created by Elif İlay KANDEMİR on 10.11.2022.
//

import UIKit

class DiscoverCell: UICollectionViewCell {
    
    static let identifier = "DiscoverCollectionCell"
 
    var moviesImageView = UIImageView()
    
    
    lazy var moviesTitleLabel : UILabel = {
        var label = UILabel()
        label.backgroundColor = UIColor(named: "black")?.withAlphaComponent(0.5)
        label.font = UIFont(name: "AppleGothic", size: 14)
        label.backgroundColor = .lightGray
        label.textAlignment = .center
        return label
    }()
    
    func collectionCellStyle(moviesName:String?){
        
        self.moviesTitleLabel.text = moviesName!
        
        
    }
    override init(frame:CGRect){
        super.init(frame:frame)
       
        self.contentView.addSubview(moviesImageView)
        self.contentView.addSubview(moviesTitleLabel)
        setConstraints()
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
            super.prepareForReuse()
            
            self.moviesImageView.image = nil
        }
    

    func setConstraints(){
        moviesImageView.addConstraint(top:contentView.topAnchor, left: contentView.leftAnchor, bottom: contentView.bottomAnchor, right: contentView.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: nil, height: nil, centerX: nil, centerY: nil)
        moviesTitleLabel.addConstraint(top: moviesImageView.bottomAnchor, left: contentView.leftAnchor, bottom: contentView.bottomAnchor, right: rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: -30, paddingRight: 0, width: nil, height: nil, centerX: nil, centerY: nil)
        
    }
    


}
