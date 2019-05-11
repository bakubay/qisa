//
//  CategoryButtonCell.swift
//  qurie
//
//  Created by mac on 8/9/18.
//  Copyright © 2018 mac. All rights reserved.
//

import UIKit

class CategoryButtonCell: UICollectionViewCell {

    @IBOutlet weak var categoryButtonImage: UIImageView!
    @IBOutlet weak var categoryButtonLabel: UILabel!
    
    
    func displayButtonContent(image: UIImage, title: String, color: UIColor){
        categoryButtonImage.image = image
        categoryButtonLabel.text = title
        self.backgroundColor = color
    }
}
