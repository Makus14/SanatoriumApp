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
    }
    
    func drawMarker(to location: CLLocationCoordinate2D) {
        //mapView.clear()
        let marker = GMSMarker(position: location)
        marker.title = "Тестовый маркер"
        marker.map = mapView
        markers.append(marker)
    }
 

}

extension MapViewController: GMSMapViewDelegate {
    
    func mapView(_ mapView: GMSMapView, didTapAt coordinate: CLLocationCoordinate2D) {
        print("Координаты нажатия: \(coordinate.latitude), \(coordinate.longitude)")
        drawMarker(to: coordinate)
    }
    
    
    func mapView(_ mapView: GMSMapView, didTap marker: GMSMarker) -> Bool {
        markers.forEach { mark in
            if mark == marker {
                mark.map = nil
        }
                    
    }
        guard let index = markers.firstIndex(of: marker) else { return true }
        markers.remove(at: index)
        return true
    }

}
