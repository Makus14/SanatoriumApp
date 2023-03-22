//
//  FuncForBackground.swift
//  Sanatorium
//
//  Created by Mac on 27/02/2023.
//

import UIKit

class FuncForBackground {
    static let display = FuncForFirebase()
    
    func funcForBackground() {
        let imageView : UIImageView = {
            let iv = UIImageView()
            iv.image = UIImage(named:"Background")
            iv.contentMode = .scaleAspectFill
            return iv
        }()
    }
    
}
