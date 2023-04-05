//
//  ServiceTableViewCell.swift
//  Sanatorium
//
//  Created by Mac on 23/03/2023.
//

import UIKit

class ServiceTableViewCell: UITableViewCell {
    static let id = String(describing: ServiceTableViewCell.self)
    
    @IBOutlet weak var imageViewOutlet: UIImageView!
    @IBOutlet weak var informationOfSanatorium: UILabel!
    @IBOutlet weak var medicationOfSanatorium: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    func setSanatoriumInfo(imageURL: URL?, info: String, medical: String) {
        imageViewOutlet.sd_setImage(with: imageURL)
        informationOfSanatorium.text = info
        medicationOfSanatorium.text = medical
       
    }

}
