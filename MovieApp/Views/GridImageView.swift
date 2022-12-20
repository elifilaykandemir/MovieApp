//
//  GridImageView.swift
//  MovieApp
//
//  Created by Elif İlay KANDEMİR on 15.12.2022.
//

import UIKit

class GridImageView:UIView{
    
    lazy var topImageView = BaseImageView()
    lazy var leftBigImageView = BaseImageView()
    lazy var rightBigImageView = BaseImageView()
    lazy var item1ImageView = BaseImageView()
    lazy var item2ImageView = BaseImageView()
    lazy var item3ImageView = BaseImageView()
    lazy var item4ImageView = BaseImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView(){
        self.addSubview(topImageView)
        self.addSubview(leftBigImageView)
        self.addSubview(rightBigImageView)
        self.addSubview(item1ImageView)
        self.addSubview(item2ImageView)
        self.addSubview(item3ImageView)
        self.addSubview(item4ImageView)
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
