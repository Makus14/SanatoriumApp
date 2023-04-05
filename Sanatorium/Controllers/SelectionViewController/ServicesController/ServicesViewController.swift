//
//  ServicesViewController.swift
//  Sanatorium
//
//  Created by Mac on 13/03/2023.
//

import UIKit

class ServicesViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var settingPoints: [EnumServiceCells] = EnumServiceCells.allCases
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        
        registerCell()
    }

    func registerCell() {
        let nib = UINib(nibName: ServiceTableViewCell.id, bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: ServiceTableViewCell.id)
        
    }

}

extension ServicesViewController: UITableViewDelegate {
    
}

extension ServicesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return settingPoints.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let typeCell = settingPoints[indexPath.row]
        
        switch typeCell {
            case .titleService:
                let cell = tableView.dequeueReusableCell(withIdentifier: ServiceTableViewCell.id, for: indexPath)
                
                guard let sanCell = cell as? ServiceTableViewCell else { return cell }
                
                return sanCell
        }
    }
    
    
}
