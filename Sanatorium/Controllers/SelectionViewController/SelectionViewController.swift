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
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    public enum DatabaseError:Error {
            case failedToReturn
        }
    
    private let database = Database.database().reference()
    
    var massCityNames = [RegionModel]() {
        didSet {
            collectionView.reloadData()
        }
    }
    
    var sortedArray = [RegionModel]()
     
    override func viewDidLoad() {
        super.viewDidLoad()
        self.collectionView?.backgroundView = imageView
        self.title = "Выбор региона"
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        getRegions()
   
        
//        getAllUsers { result in
//            switch result {
//                case .success(let success):
//                    for (_, value) in success {
//                        let nameOfCity = RegionModel(city: value, imageURL: <#String#>)
//                        self.massCityNames.append(nameOfCity)
//                        self.sortedArray = self.massCityNames.sorted { $0.city < $1.city }
//                    }
//                case .failure(let failure):
//                    print(failure)
//            }
//        }
        
        registerCell()
        
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
    
//    public func getAllUsers(completion: @escaping(Result<[String:String], Error>) -> Void) {
//            database.child("city").observeSingleEvent(of: .value) { snapshot in
//                guard let value = snapshot.value as? [String:String] else {
//                    completion(.failure(DatabaseError.failedToReturn))
//                    return
//                }
//
//                completion(.success(value))
//            }
//        }

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
        
        //let type = sortedArray[indexPath.row]
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

