//
//  SelectionViewController.swift
//  Sanatorium
//
//  Created by Mac on 18/01/2023.
//

import UIKit
import FirebaseDatabase

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
                    let vcBrest = BrestController(nibName: "BrestController", bundle: nil)
                     self.navigationController!.pushViewController(vcBrest, animated: true)
                case .vitebsk:
                    let vcVitebsk = VitebskController(nibName: "VitebskController", bundle: nil)
                     self.navigationController!.pushViewController(vcVitebsk, animated: true)
                case .gomel:
                    let vcGomel = GomelController(nibName: "GomelController", bundle: nil)
                     self.navigationController!.pushViewController(vcGomel, animated: true)
                case .grodno:
                    let vcGrodno = GrodnoController(nibName: "GrodnoController", bundle: nil)
                     self.navigationController!.pushViewController(vcGrodno, animated: true)
                case .minsk:
                    let vcMinsk = MinskController(nibName: "MinskController", bundle: nil)
                     self.navigationController!.pushViewController(vcMinsk, animated: true)
                case .mogilev:
                    let vcMogilev = MogilevController(nibName: "MogilevController", bundle: nil)
                     self.navigationController!.pushViewController(vcMogilev, animated: true)
            }
        }
    }
    
    
}

