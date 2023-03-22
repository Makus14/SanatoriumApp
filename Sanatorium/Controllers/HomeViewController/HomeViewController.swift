//
//  HomeViewController.swift
//  Sanatorium
//
//  Created by Mac on 18/01/2023.
//

import UIKit

class HomeViewController: UIViewController {
    private lazy var titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.font = UIFont.boldSystemFont(ofSize: 17.0)
        titleLabel.text = "Главная"
        return titleLabel
    }()
    
    var settingPoints: [EnumHomeCells] = EnumHomeCells.allCases
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //navigationItem.titleView = titleLabel
        tableView.dataSource = self
        tableView.delegate = self
        registerCell()
        
    }
    
    func registerCell() {
        let nib = UINib(nibName: TitleTableViewCell.id , bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: TitleTableViewCell.id)

    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let navigationBarAppearance = UINavigationBar.appearance()
        navigationBarAppearance.barTintColor = UIColor(red: 209/255, green: 206/255, blue: 184/255, alpha: 1)
        let apperanceTabBar = UITabBarAppearance()
        apperanceTabBar.backgroundColor = UIColor(red: 209/255, green: 206/255, blue: 184/255, alpha: 1)
        tabBarController?.tabBar.tintColor = UIColor(red: 65/255, green: 58/255, blue: 13/255, alpha: 1)
        
        tabBarController?.tabBar.standardAppearance = apperanceTabBar
    }


}

extension HomeViewController: UITableViewDelegate {
    
}

extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return settingPoints.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let typeCell = settingPoints[indexPath.row]
        
        switch typeCell {
            case .titleHome:
                let cell = tableView.dequeueReusableCell(withIdentifier: TitleTableViewCell.id, for: indexPath)
                guard let titleCell = cell as? TitleTableViewCell else { return cell }
                
                return titleCell
        }
       
    }
    
}
