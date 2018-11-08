//
//  Habit.swift
//  Habitual
//
//  Created by Erick Sanchez on 11/1/18.
//  Copyright © 2018 Sam Galizia. All rights reserved.
//

import Foundation
import UIKit.UIImage

struct Habit {
    enum Images: Int, CaseIterable {
        case outdoors = 0
        
        var image: UIImage {
            guard let image = UIImage(named: String(describing: self)) else {
                fatalError("image \(self) not found")
            }
            
            return image
        }
    }
    
    var title: String
    var currentStreak: Int = 0
    var dateCreated: Date = Date()
    var selectedImage: Images
}
