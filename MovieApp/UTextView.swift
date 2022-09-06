//
//  TextStyle.swift
//  MovieApp
//
//  Created by Elif İlay KANDEMİR on 4.09.2022.
//

import UIKit

class UTextView : UILabel{
    
    
    init(labelText : String ,labelFontNamed:String ,labelFontSize:CGFloat) {
        super.init(frame: CGRect.zero)
        text = labelText
        font = UIFont(name: labelFontNamed, size: labelFontSize)
        common()
      }
      
      required init?(coder aDecoder: NSCoder) {
          super.init(coder: aDecoder)
          common()
      }
      
      private func common() {
          textAlignment = .center
          textColor = .white
          translatesAutoresizingMaskIntoConstraints = false
          numberOfLines = 0
      }
}


