//
//  HabitTableViewCell.swift
//  Habitual
//
//  Created by Phyllis Wong on 8/22/18.
//  Copyright © 2018 Sam Galizia. All rights reserved.
//

import UIKit

class HabitTableViewCell: UITableViewCell {
    
    static let identifier = "habit cell"
    
    static var nib: UINib { // Making a nib out of this file with the same name
        return UINib(nibName: String(describing: self), bundle: nil)
    }
   
    // MARK: - VARS
    
    // MARK: - RETURN VALUES
    
    // MARK: - METHODS
    
    
    func configure(_ habit: Habit) {
        self.imageViewIcon.image = habit.selectedImage.image
        self.labelHabitTitle.text = habit.title
        self.labelStreaks.text = "streak: \(habit.currentStreak)"
        
        if habit.hasCompletedForToday { // Icons on the right side of the cell
            self.accessoryType = .checkmark
        } else {
            self.accessoryType = .disclosureIndicator
        }
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    // MARK: - IBACTIONS
    
    @IBOutlet weak var imageViewIcon: UIImageView!
    @IBOutlet weak var labelHabitTitle: UILabel!
    @IBOutlet weak var labelStreaks: UILabel!
    
    // MARK: - LIFE CYCLE
    
}

