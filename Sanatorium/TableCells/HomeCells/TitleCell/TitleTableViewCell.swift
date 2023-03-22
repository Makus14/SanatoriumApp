//
//  TitleTableViewCell.swift
//  Sanatorium
//
//  Created by Mac on 22/03/2023.
//

import UIKit

class TitleTableViewCell: UITableViewCell {

    static let id = String(describing: TitleTableViewCell.self)
    
    @IBOutlet weak var containerViewFirst: UIView!
    @IBOutlet weak var containerViewSecond: UIView!
    
    @IBOutlet weak var imageContainerViewFirst: UIImageView!
    
    @IBOutlet weak var imageContainerViewSecond: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        containerViewFirst.layer.cornerRadius = 10
        imageContainerViewFirst.layer.cornerRadius = 10
        containerViewSecond.layer.cornerRadius = 10
        imageContainerViewSecond.layer.cornerRadius = 10
    }

    
    
}
