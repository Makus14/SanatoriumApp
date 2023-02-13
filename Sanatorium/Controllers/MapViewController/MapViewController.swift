//
//  MapViewController.swift
//  Sanatorium
//
//  Created by Mac on 18/01/2023.
//

import UIKit
import GoogleMaps

class MapViewController: UIViewController {

    @IBOutlet weak var mapView: GMSMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Карта санаториев"
    }


 

}
