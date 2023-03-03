//
//  SanatoriumCell.swift
//  Sanatorium
//
//  Created by Mac on 27/02/2023.
//

import UIKit

class SanatoriumCell: UICollectionViewCell {
    static let id = String(describing: SanatoriumCell.self)
    
    @IBOutlet weak var cellContainer: UIView!
    @IBOutlet weak var imageViewContainer: UIView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        cellContainer.layer.borderWidth = 0.5
        
        //self.cityLabel.numberOfLines = 5
    }
    
    func setSanatorium(name: String, city: String) {
        nameLabel.text = name
        cityLabel.text = city
    }

}
