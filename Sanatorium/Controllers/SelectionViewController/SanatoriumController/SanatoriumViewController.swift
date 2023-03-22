//
//  SanatoriumViewController.swift
//  Sanatorium
//
//  Created by Mac on 10/03/2023.
//

import UIKit
import SnapKit
import SDWebImage

class SanatoriumViewController: UIViewController {
    let imageView : UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "Background")
        iv.contentMode = .scaleAspectFill
        return iv
    }()
    
    lazy var telefonButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle(sanatoriumInfo?.telefon, for: .normal)
        button.layer.borderWidth = 1
        button.layer.borderColor = CGColor(red: 65/255, green: 58/255, blue: 13/255, alpha: 1)
        button.tintColor = UIColor(red: 65/255, green: 58/255, blue: 13/255, alpha: 1)
        button.backgroundColor = .white
        button.addTarget(self, action: #selector(callNumberAction), for: .touchUpInside)
        return button
    }()
    
    var sanatoriumInfo: SanatoriumModel?
    var enumNamesPoints: [SetValue] = [.services, .rooms]
    var sanatorium: RealmSanatoriumModel?
    //var sanatoriuma = RealmManager<RealmSanatoriumModel>().read()
    
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var imageViewContainer: UIImageView!
    @IBOutlet weak var imageOfSanatorium: UIImageView!
    @IBOutlet weak var nameOfSanatoriumLabel: UILabel!
    @IBOutlet weak var adressOfSanatoriumLabel: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var favouriteOutlet: UIButton!
    
    
    override func viewDidLoad() {
        collectionView.delegate = self
        collectionView.dataSource = self
        registerCell()
        setParametrs()

        setupLayout()
        makeConstraints()
        
        setFavourite()
        
    }
    
    private func setupLayout() {
        view.addSubview(telefonButton)
    }
    
    private func makeConstraints() {
        telefonButton.snp.makeConstraints { make in
            make.width.equalTo(200)
            make.height.equalTo(42)
            make.leading.trailing.equalToSuperview()
            make.bottom.equalToSuperview().offset(-90)
        }
    }
    
    
    func registerCell() {
        let nib = UINib(nibName: SanatoriumCollectionCell.id, bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: SanatoriumCollectionCell.id)
    }
    
    func setParametrs() {
        self.title = sanatoriumInfo?.name
        self.imageViewContainer.image = UIImage(named: "Background")

        let url = URL(string: sanatoriumInfo!.imageURL)
        //let data = try? Data(contentsOf: url!)
        imageOfSanatorium.sd_setImage(with: url)
        //imageOfSanatorium.image = UIImage(data: data!)
        
        nameOfSanatoriumLabel.text = sanatoriumInfo?.name
        adressOfSanatoriumLabel.text = sanatoriumInfo?.adress
        
        
    }
    
    func setFavourite() {
        let sanatorium = RealmSanatoriumModel(name: sanatoriumInfo!.name, adress: sanatoriumInfo!.adress, id: sanatoriumInfo!.id, imageURL: sanatoriumInfo!.imageURL, lat: sanatoriumInfo!.lat, lon: sanatoriumInfo!.lon, telefon: sanatoriumInfo!.telefon, favourite: true)

        let sanatoriuma = RealmManager<RealmSanatoriumModel>().read()
        
        if sanatoriuma.isEmpty {
            
               } else {
                   for sanatoriy in sanatoriuma {
                        if sanatorium.name == sanatoriy.name {
                            favouriteOutlet.tintColor = .red
                            return
                       }
                   }
                }
    }
    
    @objc private func callNumberAction() {
        
        func callNumber() {
            if let phoneCallURL = URL(string: "tel://\(String(describing: sanatoriumInfo?.telefon))") {
                    let application:UIApplication = UIApplication.shared
                    if (application.canOpenURL(phoneCallURL)) {
                        application.open(phoneCallURL, options: [:], completionHandler: nil)
                }
            }
        }
    }
    
    @IBAction func addToFavouriteAction(_ sender: Any) {
        let sanatorium = RealmSanatoriumModel(name: sanatoriumInfo!.name, adress: sanatoriumInfo!.adress, id: sanatoriumInfo!.id, imageURL: sanatoriumInfo!.imageURL, lat: sanatoriumInfo!.lat, lon: sanatoriumInfo!.lon, telefon: sanatoriumInfo!.telefon, favourite: true)
        let sanatoriuma = RealmManager<RealmSanatoriumModel>().read()
        
        if sanatoriuma.isEmpty {
                   RealmManager<RealmSanatoriumModel>().write(object: sanatorium)
            favouriteOutlet.tintColor = .red
               } else {
                   for sanatoriy in sanatoriuma {
                        if sanatorium.name == sanatoriy.name {
                           RealmManager<RealmSanatoriumModel>().delete(object: sanatoriy)
                            favouriteOutlet.tintColor = .white
                            return
                       }
                   }
                        RealmManager<RealmSanatoriumModel>().write(object: sanatorium)
                        favouriteOutlet.tintColor = .red
                }
    }
    
    
}

extension SanatoriumViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let type = enumNamesPoints[indexPath.row]
        switch type {
            case .services:
                let vcServices = ServicesViewController(nibName: "ServicesViewController", bundle: nil)
                self.navigationController!.pushViewController(vcServices, animated: true)
            case .rooms:
                let vcRooms = RoomsViewController(nibName: "RoomsViewController", bundle: nil)
                self.navigationController!.pushViewController(vcRooms, animated: true)
        }
    }
}

extension SanatoriumViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return enumNamesPoints.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let type = enumNamesPoints[indexPath.row]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SanatoriumCollectionCell.id, for: indexPath)
        guard let sanCell = cell as? SanatoriumCollectionCell else { return cell }
        
        sanCell.setupData(type: type)
        return sanCell
    }
    
    
}
