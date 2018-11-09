//
//  MainViewController.swift
//  Habitual
//
//  Created by Sam Galizia on 8/21/18.
//  Copyright © 2018 Sam Galizia. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    private var persistance = PersistenceLayer()
    
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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        persistance.refreshHabits()
        tableView.reloadData()
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
        _ = persistance.createNewHabit(name: "LOL", image: .outdoors)
        tableView.insertRows(at: [IndexPath(row: 0, section: 0)], with: .automatic)
        
        return ()
        let addHabitVc = AddHabitViewController.instantiate()
        navigationController?.pushViewController(addHabitVc, animated: true)
    }
}

// MARK: - Tableview Delegate Methods

extension MainViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return persistance.habits.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 64
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
            withIdentifier: HabitTableViewCell.identifier,
            for: indexPath
            ) as! HabitTableViewCell
        
        let habit = persistance.habits[indexPath.row]
        cell.configure(habit)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let selectedHabit = persistance.habits[indexPath.row]
        let habitDetailedVc = HabitDetailedViewController.instantiate()
        habitDetailedVc.habit = selectedHabit
        habitDetailedVc.habitIndex = indexPath.row
        navigationController?.pushViewController(habitDetailedVc, animated: true)
    }
}

