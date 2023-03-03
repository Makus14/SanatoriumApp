//
//  GrodnoController.swift
//  Sanatorium
//
//  Created by Mac on 16/02/2023.
//

import UIKit

class GrodnoController: UIViewController {
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
        self.title = "Гродненская область"
    }




}
