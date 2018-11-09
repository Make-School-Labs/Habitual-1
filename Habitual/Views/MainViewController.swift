//
//  MainViewController.swift
//  Habitual
//
//  Created by Sam Galizia on 8/21/18.
//  Copyright © 2018 Sam Galizia. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    var habits: [Habit] = [
        Habit.init(title: "Sleep", image: Habit.Images.outdoors)
    ]
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        setupNavBar()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(
            HabitTableViewCell.nib,
            forCellReuseIdentifier: HabitTableViewCell.identifier
        )
    }
    
}

// MARK: - Navigation Bar Code

extension MainViewController {
    
    func setupNavBar() {
        title = "Habitual"
        
        let addButton = UIBarButtonItem(title: "Add", style: .plain, target: self, action: #selector(addHabit(_:)))
        
        navigationItem.rightBarButtonItem = addButton
    }
    
    @objc func addHabit(_ sender: UIBarButtonItem) {
        let addHabitVc = AddHabitViewController.instantiate()
        let navigationController = UINavigationController(rootViewController: addHabitVc)
        present(navigationController, animated: true, completion: nil)
        
    }
}

// MARK: - Tableview Delegate Methods

extension MainViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return habits.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 64
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
            withIdentifier: HabitTableViewCell.identifier,
            for: indexPath
            ) as! HabitTableViewCell
        
        let habit = habits[indexPath.row]
        cell.configure(habit)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let selectedHabit = habits[indexPath.row]
        let habitDetailedVc = HabitDetailedViewController.instantiate()
        habitDetailedVc.habit = selectedHabit
        navigationController?.pushViewController(habitDetailedVc, animated: true)
    }
}

