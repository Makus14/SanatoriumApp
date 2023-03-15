//
//  DefaultsManager.swift
//  Sanatorium
//
//  Created by Mac on 12/03/2023.
//

import Foundation

class DefaultsManager {
    private static let defaults = UserDefaults.standard
    
    static var sanatorium: SanatoriumModel? {
        get {
            defaults.value(forKey: #function) as? SanatoriumModel
        }
        set {
            defaults.set(newValue, forKey: #function)
        }
    }
}
