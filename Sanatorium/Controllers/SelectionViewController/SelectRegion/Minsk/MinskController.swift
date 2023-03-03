//
//  MinskController.swift
//  Sanatorium
//
//  Created by Mac on 16/02/2023.
//

import UIKit

class MinskController: UIViewController {
    let imageView : UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named:"Background")
        iv.contentMode = .scaleAspectFill
        return iv
    }()
    
    var massSanatoruim = [SanatoriumModel]() {
        didSet {
            collectionView.reloadData()
        }
    }
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.collectionView?.backgroundView = imageView
        self.title = "Минская область"
        collectionView.dataSource = self
        collectionView.delegate = self
        
        registerCell()
    }

    func registerCell() {
        let nib = UINib(nibName: SanatoriumCell.id, bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: SanatoriumCell.id)
    }


}

extension MinskController: UICollectionViewDelegate {
    
}

extension MinskController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SanatoriumCell.id, for: indexPath)
        guard let sanCell = cell as? SanatoriumCell else { return cell }
        
        return sanCell
    }
    
    
}
