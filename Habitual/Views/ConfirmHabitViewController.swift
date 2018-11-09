//
//  ConfirmHabitViewController.swift
//  Habitual
//
//  Created by Noah Woodward on 11/8/18.
//  Copyright © 2018 Sam Galizia. All rights reserved.
//

import UIKit

class ConfirmHabitViewController: UIViewController {

    // MARK: - VARS
    
    var habitImage: Habit.Images!
    
    // MARK: - RETURN VALUES
    
    // MARK: - METHODS
    
    private func updateUI() {
        title = "New Habit"
        habitImageView.image = habitImage.image
    }
    
    // MARK: - IBACTIONS
    
    @IBOutlet weak var habitImageView: UIImageView!
    @IBOutlet weak var nameOfHabitLabel: UILabel!
    @IBOutlet weak var habitNameInputField: UITextField!
    @IBOutlet weak var createHabitButton: UIButton!
    
    @IBAction func createHabitButtonPressed(_ sender: Any) {
        var persistenceLayer = PersistenceLayer()
        guard let habitText = habitNameInputField.text else { return }
        
        persistenceLayer.createNewHabit(name: habitText, image: habitImage)
        self.presentingViewController?.dismiss(animated: true, completion: nil)
    }
    
    // MARK: - LIFE CYCLE
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        updateUI()
    }
}
