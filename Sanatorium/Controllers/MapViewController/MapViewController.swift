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
    var markers = [GMSMarker]()
    
    private var allMarkers = [GMSMarker]()
    
    var massSanatorium = [SanatoriumModel]()
      
    private lazy var titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.font = UIFont.boldSystemFont(ofSize: 17.0)
        titleLabel.text = "Карта санаториев"
        return titleLabel
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.titleView = titleLabel
        mapView.delegate = self
        
        let location = GMSCameraPosition.camera(withLatitude: 53.6617, longitude: 28.0745, zoom: 5.8)
        mapView.camera = location
        
        getSanatorium()
    }
    
    private func drawMarker(sanatorium: SanatoriumModel) {
        guard let sanXcoordinate = Double(sanatorium.lat),
              let sanYcoordinate = Double(sanatorium.lon) else { return }
        
        let position = CLLocationCoordinate2D(latitude: sanXcoordinate, longitude: sanYcoordinate)
        let marker = GMSMarker(position: position)
        var i: Int = 0
        for _ in massSanatorium {
            marker.title = massSanatorium[i].name
            i = i + 1
        }
        allMarkers.append(marker)
        marker.map = mapView
    }
    
    private func getSanatorium() {
        FuncForFirebase.shared.getSanatoriums { result in
            switch result {
                case .success(let success):
                    var i: Int = 0
                    for temp in success {
                        self.massSanatorium.append(success[i])
                        self.drawMarker(sanatorium: temp)
                        //print(success[i].name)
                        i = i + 1
                    }
                case .failure(let failure):
                    print(failure)
            }
        }
    }
 
}

extension MapViewController: GMSMapViewDelegate {
    
}
