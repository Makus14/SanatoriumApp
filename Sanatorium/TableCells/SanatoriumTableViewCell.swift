//
//  SanatoriumTableViewCell.swift
//  Sanatorium
//
//  Created by Mac on 21/03/2023.
//

import UIKit
import SDWebImage

class SanatoriumTableViewCell: UITableViewCell {
    
    static let id = String(describing: SanatoriumTableViewCell.self)
    
    @IBOutlet weak var iamgeOutlet: UIImageView!
    @IBOutlet weak var nameOutlet: UILabel!
    @IBOutlet weak var adressOutlet: UILabel!

    @IBOutlet weak var viewContainer: UIView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        viewContainer.layer.borderWidth = 0.5
        iamgeOutlet.layer.cornerRadius = 20
        viewContainer.layer.cornerRadius = 20
    }

    func setSanatorium(name: String, city: String, imageURL: URL?) {
        nameOutlet.text = name
        adressOutlet.text = city
        iamgeOutlet.sd_setImage(with: imageURL)
    }


    
}
