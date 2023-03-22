//
//  RealmSanatoriumModel.swift
//  Sanatorium
//
//  Created by Mac on 21/03/2023.
//

import Foundation
import RealmSwift

class RealmSanatoriumModel: Object {
    @objc dynamic var name: String = ""
    @objc dynamic var adress: String = ""
    @objc dynamic var id: String = ""
    @objc dynamic var imageURL = ""
    @objc dynamic var lat = ""
    @objc dynamic var lon = ""
    @objc dynamic var telefon = ""
    @objc dynamic var favourite = false
    
    convenience init(name: String, adress: String, id: String, imageURL: String, lat: String, lon: String, telefon: String, favourite: Bool) {
        self.init()
        self.name = name
        self.adress = adress
        self.id = id
        self.imageURL = imageURL
        self.lat = lat
        self.lon = lon
        self.telefon = telefon
        self.favourite = favourite
    }
}
