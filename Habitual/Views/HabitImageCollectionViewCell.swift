//
//  HabitImageCollectionViewCell.swift
//  Habitual
//
//  Created by Noah Woodward on 11/8/18.
//  Copyright © 2018 Noah Woodward. All rights reserved.
//

import UIKit

class HabitImageCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "habit image cell"
    
    static var nib: UINib { // Registering the collection view when adding a new habit
        return UINib(nibName: String(describing: self), bundle: nil)
    }
    
    func setImage(image: UIImage){
        self.habitImage.image = image
    }
    
    @IBOutlet weak var habitImage: UIImageView!
    
}

