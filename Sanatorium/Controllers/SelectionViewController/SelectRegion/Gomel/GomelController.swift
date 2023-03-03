//
//  GomelController.swift
//  Sanatorium
//
//  Created by Mac on 16/02/2023.
//

import UIKit

class GomelController: UIViewController {
    let imageView : UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named:"Background")
        iv.contentMode = .scaleAspectFill
        return iv
    }()
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.collectionView?.backgroundView = imageView
        self.title = "Гомельская область"
    }



}
