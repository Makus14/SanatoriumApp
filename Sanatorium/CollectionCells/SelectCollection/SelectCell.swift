//
//  SelectCell.swift
//  Sanatorium
//
//  Created by Mac on 13/02/2023.
//

import UIKit

class SelectCell: UICollectionViewCell {
    static let id = String(describing: SelectCell.self)
    
    @IBOutlet weak var nameOfRegionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    func setName(type: EnumNames) {
        nameOfRegionLabel.text = type.title
    }
}
