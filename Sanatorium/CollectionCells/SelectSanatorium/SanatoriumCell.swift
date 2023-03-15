//
//  SanatoriumCell.swift
//  Sanatorium
//
//  Created by Mac on 27/02/2023.
//

import UIKit
import SDWebImage

class SanatoriumCell: UICollectionViewCell {
    static let id = String(describing: SanatoriumCell.self)
    
    @IBOutlet weak var cellContainer: UIView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        cellContainer.layer.borderWidth = 0.5
        imageView.layer.cornerRadius = 20
        cellContainer.layer.cornerRadius = 20
        
        //self.cityLabel.numberOfLines = 5
    }
    
    func setSanatorium(name: String, city: String, imageURL: URL?) {
        nameLabel.text = name
        cityLabel.text = city
        imageView.sd_setImage(with: imageURL)
    }

}

