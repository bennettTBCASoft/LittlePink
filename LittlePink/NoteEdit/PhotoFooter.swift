//
//  PhotoFooter.swift
//  LittlePink
//
//  Created by 竣亦 on 2022/4/24.
//

import UIKit

class PhotoFooter: UICollectionReusableView {
        
    @IBOutlet weak var addButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        layer.borderColor = UIColor.quaternaryLabel.cgColor
        layer.borderWidth = 1
    }
}
