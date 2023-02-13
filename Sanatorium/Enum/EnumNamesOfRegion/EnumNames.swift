//
//  EnumNames.swift
//  Sanatorium
//
//  Created by Mac on 13/02/2023.
//

import Foundation
import UIKit

enum EnumNames: CaseIterable {
    case brest
    case vitebsk
    case gomel
    case grodno
    case minsk
    case mogilev
    
    var title: String {
        switch self {
            case .brest:        return "Брестская область"
            case .vitebsk:      return "Витебская область"
            case .gomel:        return "Гомельская область"
            case .grodno:       return "Гродненская область"
            case .minsk:        return "Минская область"
            case .mogilev:      return "Могилевская область"
        }
    }

}
