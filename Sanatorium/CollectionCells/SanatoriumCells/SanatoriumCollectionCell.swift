//
//  SanatoriumCollectionCell.swift
//  Sanatorium
//
//  Created by Mac on 11/03/2023.
//

import UIKit

class SanatoriumCollectionCell: UICollectionViewCell {
    static let id = String(describing: SanatoriumCollectionCell.self)

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameOfCollectionLabel: UILabel!
    @IBOutlet weak var viewContent: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()

    }

    func setupData(type: SetValue) {
        nameOfCollectionLabel.text = type.title
        imageView.image = type.image
        self.viewContent.layer.cornerRadius = 12
        self.viewContent.layer.borderWidth = 0.3
        self.viewContent.layer.masksToBounds = true
        
    }

}

enum SetValue: CaseIterable {
    case services
    case rooms

    var title: String {
        switch self {
            case .services:       return "Услуги и цены"
            case .rooms:          return "Номера"

        }
    }

    var image: UIImage? {
        switch self {
            case .services:       return UIImage(systemName: "building.fill")
            case .rooms:          return UIImage(systemName: "doc.text.fill")

        }
    }
}

