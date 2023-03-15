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
    
    var massSanatorium = [SanatoriumModel]() {
        didSet {
            collectionView.reloadData()
        }
    }
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.collectionView?.backgroundView = imageView
        self.title = "Гродненская область"
        collectionView.dataSource = self
        collectionView.delegate = self
        
        registerCell()
        getSanatorium()
    }
    
    func registerCell() {
        let nib = UINib(nibName: SanatoriumCell.id, bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: SanatoriumCell.id)
    }
    
    private func getSanatorium() {
        FuncForFirebase.shared.getSanatoriums { result in
            switch result {
                case .success(let success):
                    var i: Int = 0
                    for _ in success {
                        if success[i].id == "4" {
                            self.massSanatorium.append(success[i])
                        }
                        i = i + 1
                    }
                case .failure(let failure):
                    print(failure)
            }
        }
    }




}

extension GrodnoController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let vcSanatorium = SanatoriumViewController(nibName: "SanatoriumViewController", bundle: nil)
        vcSanatorium.sanatoriumInfo = self.massSanatorium[indexPath.row]
        self.navigationController!.pushViewController(vcSanatorium, animated: true)
    }
}

extension GrodnoController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return massSanatorium.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SanatoriumCell.id, for: indexPath)
        
        guard let sanCell = cell as? SanatoriumCell else { return cell }
        
        let nameOfSanatorium = String(massSanatorium[indexPath.row].name)
        let adressOfSanatorium = String(massSanatorium[indexPath.row].adress)
        let imageURL = URL(string: massSanatorium[indexPath.row].imageURL)
        
        sanCell.setSanatorium(name: nameOfSanatorium, city: adressOfSanatorium, imageURL: imageURL)
        
        return sanCell
    }
    
    
}
