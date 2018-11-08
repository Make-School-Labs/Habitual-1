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

    @IBOutlet weak var habitImage: UIImageView!
    
    @IBOutlet weak var nameOfHabitLabel: UILabel!
    
    
    @IBOutlet weak var habitNameInputField: UITextField!
    
    @IBOutlet weak var createHabitButton: UIButton!
    
    // MARK: - RETURN VALUES
    
    // MARK: - METHODS
    private func updateUI() {
        title = "New Habit"
    }
    
    // MARK: - IBACTIONS
    
    @IBAction func createHabitButtonPressed(_ sender: Any) {
        
    }
    
    
    // MARK: - LIFE CYCLE
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        updateUI()
    }
 

}
