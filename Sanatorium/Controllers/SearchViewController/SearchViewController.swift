//
//  SearchViewController.swift
//  Sanatorium
//
//  Created by Mac on 18/01/2023.
//

import UIKit

class SearchViewController: UIViewController {
    let imageView : UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named:"Background")
        iv.contentMode = .scaleAspectFill
        return iv
    }()
    
    private lazy var titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.font = UIFont.boldSystemFont(ofSize: 17.0)
        titleLabel.text = "Поиск санаториев"
        return titleLabel
    }()
    
    @IBOutlet weak var searchFieldOutlet: UITextField!
    @IBOutlet weak var searchView: UIView!
    @IBOutlet weak var collectionView: UICollectionView!
        
    var massSanatorium = [SanatoriumModel]() {
        didSet {
            collectionView.reloadData()
        }
    }
    
    var massSearch = [SanatoriumModel]() {
        didSet {
            collectionView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.titleView = titleLabel
        searchView.layer.cornerRadius = 27
        self.collectionView?.backgroundView = imageView
        collectionView.delegate = self
        collectionView.dataSource = self
        
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
                        self.massSanatorium.append(success[i])
                        i = i + 1
                    }
                    self.massSearch = self.massSanatorium
                case .failure(let failure):
                    print(failure)
            }
        }
    }

    @IBAction func searchAction(_ sender: Any) {
        massSearch.removeAll()
        
            var i: Int = 0
            let text = self.searchFieldOutlet.text!.lowercased()
            for _ in massSanatorium {
                let isArrayContains = massSanatorium[i].name.lowercased().range(of: text)
                if isArrayContains != nil {
                    self.massSearch.append(massSanatorium[i])
                }
                i = i + 1
            }
        
    }
    
}

extension SearchViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let vcSanatorium = SanatoriumViewController(nibName: "SanatoriumViewController", bundle: nil)
        vcSanatorium.sanatoriumInfo = self.massSearch[indexPath.row]
        self.navigationController!.pushViewController(vcSanatorium, animated: true)
    }
}

extension SearchViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return massSearch.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SanatoriumCell.id, for: indexPath)
        guard let sanCell = cell as? SanatoriumCell else { return cell }
        
        let nameOfSanatorium = String(massSearch[indexPath.row].name)
        let adressOfSanatorium = String(massSearch[indexPath.row].adress)
        let imageURL = URL(string: massSearch[indexPath.row].imageURL)
        
        sanCell.setSanatorium(name: nameOfSanatorium, city: adressOfSanatorium, imageURL: imageURL)
        
        return sanCell
    }
    
    
}
