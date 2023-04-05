//
//  FavouriteViewController.swift
//  Sanatorium
//
//  Created by Mac on 18/01/2023.
//

import UIKit

class FavouriteViewController: UIViewController {
    let imageView : UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "Background")
        iv.contentMode = .scaleAspectFill
        return iv
    }()
    
    @IBOutlet weak var tableView: UITableView!
    
    var sanatorium = RealmManager<RealmSanatoriumModel>().read()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView?.backgroundView = imageView
        self.title = "Избранное"
        tableView.delegate = self
        tableView.dataSource = self
        
        registerCell()
        
        sanatorium = RealmManager<RealmSanatoriumModel>().read()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        sanatorium = RealmManager<RealmSanatoriumModel>().read()
        tableView.reloadData()
        
    }
    
    func registerCell() {
        let nib = UINib(nibName: SanatoriumTableViewCell.id, bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: SanatoriumTableViewCell.id)
    }

}

extension FavouriteViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        let sanatoriuma = sanatorium[indexPath.row]
        if editingStyle == .delete {
            
            RealmManager<RealmSanatoriumModel>().delete(object: sanatoriuma)
            sanatorium = RealmManager<RealmSanatoriumModel>().read()
            tableView.reloadData()
            
        }
    }

}

extension FavouriteViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sanatorium.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: SanatoriumTableViewCell.id, for: indexPath)
        
                guard let sanCell = cell as? SanatoriumTableViewCell else { return cell }
        
                let nameOfSanatorium = String(sanatorium[indexPath.row].name)
                let adressOfSanatorium = String(sanatorium[indexPath.row].adress)
                let imageURL = URL(string: sanatorium[indexPath.row].imageURL)
        
                sanCell.setSanatorium(name: nameOfSanatorium, city: adressOfSanatorium, imageURL: imageURL)
        
                return sanCell
    }
    
    
}
