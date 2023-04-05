//
//  ChoiceRegionController.swift
//  Sanatorium
//
//  Created by Mac on 24/02/2023.
//

import UIKit

class ChoiceRegionController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    var massCityNames = [RegionModel]() {
        didSet {
            collectionView.reloadData()
        }
    }
    
    let imageView : UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named:"Background")
        iv.contentMode = .scaleAspectFill
        return iv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.collectionView?.backgroundView = imageView
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        registerCell()
        getRegions()
        
    }
    
    func registerCell() {
        let nib = UINib(nibName: SelectCell.id, bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: SelectCell.id)
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

}

extension ChoiceRegionController: UICollectionViewDataSource {
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

extension ChoiceRegionController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == collectionView {

            switch indexPath.row {
                case 0:
                    let vcBrest = AddNewSanatoriumController(nibName: "AddNewSanatoriumController", bundle: nil)
                    vcBrest.modalTransitionStyle = .crossDissolve
                    vcBrest.modalPresentationStyle = .overFullScreen
                    vcBrest.ownerIdOfRegion = self.massCityNames[indexPath.row].ownerID
                    present(vcBrest, animated: true)
                case 1:
                    let vcGomel = AddNewSanatoriumController(nibName: "AddNewSanatoriumController", bundle: nil)
                    vcGomel.modalTransitionStyle = .crossDissolve
                    vcGomel.modalPresentationStyle = .overFullScreen
                    vcGomel.ownerIdOfRegion = self.massCityNames[indexPath.row].ownerID
                    present(vcGomel, animated: true)
                case 2:
                    let vcGrodno = AddNewSanatoriumController(nibName: "AddNewSanatoriumController", bundle: nil)
                    vcGrodno.modalTransitionStyle = .crossDissolve
                    vcGrodno.modalPresentationStyle = .overFullScreen
                    vcGrodno.ownerIdOfRegion = self.massCityNames[indexPath.row].ownerID
                    present(vcGrodno, animated: true)
                case 3:
                    let vcMinsk = AddNewSanatoriumController(nibName: "AddNewSanatoriumController", bundle: nil)
                    vcMinsk.modalTransitionStyle = .crossDissolve
                    vcMinsk.modalPresentationStyle = .overFullScreen
                    vcMinsk.ownerIdOfRegion = self.massCityNames[indexPath.row].ownerID
                    present(vcMinsk, animated: true)
                case 4:
                    let vcMogilev = AddNewSanatoriumController(nibName: "AddNewSanatoriumController", bundle: nil)
                    vcMogilev.modalTransitionStyle = .crossDissolve
                    vcMogilev.modalPresentationStyle = .overFullScreen
                    vcMogilev.ownerIdOfRegion = self.massCityNames[indexPath.row].ownerID
                    present(vcMogilev, animated: true)
                case 5:
                    let vcVitebsk = AddNewSanatoriumController(nibName: "AddNewSanatoriumController", bundle: nil)
                    vcVitebsk.modalTransitionStyle = .crossDissolve
                    vcVitebsk.modalPresentationStyle = .overFullScreen
                    vcVitebsk.ownerIdOfRegion = self.massCityNames[indexPath.row].ownerID
                    present(vcVitebsk, animated: true)
                default:
                    print("ERROR")
            }
        }
    }
}

