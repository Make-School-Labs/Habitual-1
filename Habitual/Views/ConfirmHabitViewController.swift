//
//  ConfirmHabitViewController.swift
//  Habitual
//
//  Created by Noah Woodward on 11/8/18.
//  Copyright © 2018 Sam Galizia. All rights reserved.
//

import UIKit

class ConfirmHabitViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    // MARK: - VARS
    var habitImage: UIImage!

    @IBOutlet weak var habitImageView: UIImageView!
    
    @IBOutlet weak var nameOfHabitLabel: UILabel!
    
    
    @IBOutlet weak var habitNameInputField: UITextField!
    
    @IBOutlet weak var createHabitButton: UIButton!
    
    // MARK: - RETURN VALUES
    
    // MARK: - METHODS
    private func updateUI() {
        title = "New Habit"
        habitImageView.image = habitImage
    }
    
    // MARK: - IBACTIONS
    
    @IBAction func createHabitButtonPressed(_ sender: Any) {
        let selectedImage = Habit.Images.outdoors
        var persistenceLayer = PersistenceLayer()
        guard let habitText = habitNameInputField.text else {return}
        persistenceLayer.createNewHabit(name: habitText, image: selectedImage)
        self.presentingViewController?.dismiss(animated: true, completion: nil)
    }
    
    
    // MARK: - LIFE CYCLE
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        updateUI()
    }
 

}
