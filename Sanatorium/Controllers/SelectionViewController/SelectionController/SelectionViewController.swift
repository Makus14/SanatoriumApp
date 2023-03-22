//
//  SelectionViewController.swift
//  Sanatorium
//
//  Created by Mac on 18/01/2023.
//

import UIKit
import FirebaseDatabase
import FirebaseStorage
import Firebase

class SelectionViewController: UIViewController {
    let imageView : UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named:"Background")
        iv.contentMode = .scaleAspectFill
        return iv
    }()
    
    private lazy var titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.font = UIFont.boldSystemFont(ofSize: 17.0)
        titleLabel.text = "Выбор региона"
        return titleLabel
    }()
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var massCityNames = [RegionModel]() {
        didSet {
            collectionView.reloadData()
        }
    }
     
    override func viewDidLoad() {
        super.viewDidLoad()
        self.collectionView?.backgroundView = imageView
        navigationItem.titleView = titleLabel
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        getRegions()
        registerCell()
        setupNavBar()
        
        }
    
    private func getRegions() {
            FuncForFirebase.shared.getRegions { result in
                switch result {
                    case .success(let success):
                        self.massCityNames = success
                    case .failure(let failure):
                        print(failure)
                }
            }
        }
    
    private func setupNavBar() {
        let button = UIButton()
        button.addTarget(self, action: #selector(addSanatorium), for: .allEvents)
        button.setImage(UIImage(systemName: "plus"), for: .normal)
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: button)
    }
    
    @objc func addSanatorium() {
        let vc = ChoiceRegionController(nibName: "ChoiceRegionController", bundle: nil)
        
        //vc.modalTransitionStyle = .crossDissolve
        //vc.modalPresentationStyle = .overFullScreen
        present(vc, animated: true)
        //self.navigationController!.pushViewController(vc, animated: true)
        
        //self.navigationController!.pushViewController(vc, animated: true)
    }
    

    func registerCell() {
        let nib = UINib(nibName: SelectCell.id, bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: SelectCell.id)
    }

}

extension SelectionViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return massCityNames.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SelectCell.id, for: indexPath)
        guard let nameCell = cell as? SelectCell else { return cell }
        
        let imageURL = URL(string: massCityNames[indexPath.row].imageURL)
        let city = String (massCityNames[indexPath.row].city)
               
        nameCell.setName(city: city, imageURL: imageURL)
        return nameCell
    }
}

extension SelectionViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == collectionView {

            switch indexPath.row {
                case 0:
                    let vcBrest = BrestController(nibName: "BrestController", bundle: nil)
                    self.navigationController!.pushViewController(vcBrest, animated: true)
                case 1:
                    let vcGomel = GomelController(nibName: "GomelController", bundle: nil)
                     self.navigationController!.pushViewController(vcGomel, animated: true)
                case 2:
                    let vcGrodno = GrodnoController(nibName: "GrodnoController", bundle: nil)
                     self.navigationController!.pushViewController(vcGrodno, animated: true)
                case 3:
                    let vcMinsk = MinskController(nibName: "MinskController", bundle: nil)
                     self.navigationController!.pushViewController(vcMinsk, animated: true)
                case 4:
                    let vcMogilev = MogilevController(nibName: "MogilevController", bundle: nil)
                     self.navigationController!.pushViewController(vcMogilev, animated: true)
                case 5:
                    let vcVitebsk = VitebskController(nibName: "VitebskController", bundle: nil)
                     self.navigationController!.pushViewController(vcVitebsk, animated: true)
                default:
                    print("ERROR")
            }
        }
    }
    
    
}

