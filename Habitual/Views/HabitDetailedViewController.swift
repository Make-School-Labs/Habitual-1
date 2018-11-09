//
//  HabitDetailedViewController.swift
//  Habitual
//
//  Created by Erick Sanchez on 11/1/18.
//  Copyright © 2018 Sam Galizia. All rights reserved.
//

import UIKit

class HabitDetailedViewController: UIViewController {
    
    // MARK: - VARS
    
    var habit: Habit!
    var habitIndex: Int!
    
    private var persistance = PersistenceLayer()
    
    // MARK: - RETURN VALUES
    
    // MARK: - METHODS
    
    private func updateUI() {
        title = habit.title
        imageViewIcon.image = habit.selectedImage.image
        labelCurrentStreak.text = "\(habit.currentStreak) days"
        labelTotalCompletions.text = String(habit.numberOfCompletions)
        labelBestStreak.text = String(habit.bestStreak)
//        labelStartingDate.text = habit.dateCreated.stringValue
    }
    
    // MARK: - IBACTIONS
    
    @IBOutlet weak var imageViewIcon: UIImageView!
    @IBOutlet weak var labelCurrentStreak: UILabel!
    @IBOutlet weak var labelTotalCompletions: UILabel!
    @IBOutlet weak var labelBestStreak: UILabel!
    @IBOutlet weak var labelStartingDate: UILabel!
    @IBOutlet weak var buttonAction: UIButton!
    @IBAction func pressActionButton(_ sender: Any) {
        habit = persistance.markHabitAsCompleted(habitIndex)
        updateUI()
    }
    
    // MARK: - LIFE CYCLE
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        updateUI()
    }
}
