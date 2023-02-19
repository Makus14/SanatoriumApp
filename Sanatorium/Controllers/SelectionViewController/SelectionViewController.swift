//
//  SelectionViewController.swift
//  Sanatorium
//
//  Created by Mac on 18/01/2023.
//

import UIKit

class SelectionViewController: UIViewController {
    let imageView : UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named:"Background")
        iv.contentMode = .scaleAspectFill
        return iv
    }()
    
    //let massNames: [String] = ["Брестская область", "Витебская область", "Гомельская область", "Гродненская область", "Минская область", "Витебская область"]
    
    let massNames: [EnumNames] = [.brest, .vitebsk, .gomel, .grodno, .minsk, .mogilev]
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.collectionView?.backgroundView = imageView
        self.title = "Выбор региона"
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        registerCell()
        
        
    }

    func registerCell() {
        let nib = UINib(nibName: SelectCell.id, bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: SelectCell.id)
    }

   

}

extension SelectionViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return massNames.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let type = massNames[indexPath.row]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SelectCell.id, for: indexPath)
        
        guard let nameCell = cell as? SelectCell else { return cell }
        
        nameCell.setName(type: type)
        return nameCell
    }
}

extension SelectionViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == collectionView {
            let type = massNames[indexPath.row]

            switch type {
                case .brest:
                    
                    let vc = BrestController(nibName: "BrestController", bundle: nil)
                     self.navigationController!.pushViewController(vc, animated: true)
                    
                    
                    
                case .vitebsk:
                    let mainstoryboard:UIStoryboard = UIStoryboard(name: "BrestController", bundle: nil)
                    let initialController = mainstoryboard.instantiateViewController(withIdentifier: "BrestController") as! BrestController
                    self.navigationController?.pushViewController(initialController, animated: true)
                case .gomel:
                    let storyboard = UIStoryboard(name: "BrestController", bundle: nil)
                    let brestVC = storyboard.instantiateViewController(withIdentifier: "BrestController") as! BrestController
                    self.navigationController?.pushViewController(brestVC, animated: true)
                case .grodno:
                    let storyboard = UIStoryboard(name: "BrestController", bundle: nil)
                    let brestVC = storyboard.instantiateViewController(withIdentifier: "BrestController") as! BrestController
                    self.navigationController?.pushViewController(brestVC, animated: true)
                case .minsk:
                    let storyboard = UIStoryboard(name: "BrestController", bundle: nil)
                    let brestVC = storyboard.instantiateViewController(withIdentifier: "BrestController") as! BrestController
                    self.navigationController?.pushViewController(brestVC, animated: true)
                case .mogilev:
                    let storyboard = UIStoryboard(name: "BrestController", bundle: nil)
                    let brestVC = storyboard.instantiateViewController(withIdentifier: "BrestController") as! BrestController
                    self.navigationController?.pushViewController(brestVC, animated: true)
            }
        }
    }
    
    
}

