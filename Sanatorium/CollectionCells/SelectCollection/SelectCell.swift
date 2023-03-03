//
//  SelectCell.swift
//  Sanatorium
//
//  Created by Mac on 13/02/2023.
//

import UIKit
import SDWebImage

class SelectCell: UICollectionViewCell {
    static let id = String(describing: SelectCell.self)
    
    @IBOutlet weak var nameOfRegionLabel: UILabel!
    @IBOutlet weak var imageOfRegion: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    func setName(city: String, imageURL: URL?) {
        nameOfRegionLabel.text = city
        imageOfRegion.sd_setImage(with: imageURL)
    }
}
