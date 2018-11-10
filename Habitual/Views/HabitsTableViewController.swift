//
//  HabitsTableViewController.swift
//  Habitual
//
//  Created by Sam Galizia on 8/21/18.
//  Copyright © 2018 Sam Galizia. All rights reserved.
//

import UIKit

class HabitsTableViewController: UITableViewController {
    
    // MARK: - VARS
    
    private var persistance = PersistenceLayer()
    
    var habits = [Habit]()
    
    // MARK: - RETURN VALUES
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return persistance.habits.count
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 64
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
            withIdentifier: HabitTableViewCell.identifier,
            for: indexPath
            ) as! HabitTableViewCell
        
        let habit = persistance.habits[indexPath.row]
        cell.configure(habit)
        
        return cell
    }
    
    // MARK: - METHODS
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let selectedHabit = persistance.habits[indexPath.row]
        let habitDetailedVc = HabitDetailedViewController.instantiate()
        habitDetailedVc.habit = selectedHabit
        habitDetailedVc.habitIndex = indexPath.row
        navigationController?.pushViewController(habitDetailedVc, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        switch editingStyle {
        case .delete:
            let habitToDelete = persistance.habits[indexPath.row]
            let habitIndexToDelete = indexPath.row
            
            let deleteAlert = UIAlertController(habitTitle: habitToDelete.title) {
                self.persistance.delete(habitIndexToDelete)
                tableView.deleteRows(at: [indexPath], with: .automatic)
            }
            
            self.present(deleteAlert, animated: true)
        default:
            break
        }
    }
    
    override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        persistance.swapHabits(habitIndex: sourceIndexPath.row, destinationIndex: destinationIndexPath.row)
    }
    
    // MARK: - IBACTIONS
    
    // MARK: - LIFE CYCLE
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let day = 60*60*24
        
        var aHabit = Habit(title: "Buttttt", image: .forest)
        aHabit.lastCompletionDate = Date(timeIntervalSinceNow: TimeInterval(-day*2))
        aHabit.currentStreak = 100
        
        var bHabit = Habit(title: "lololol", image: .forest)
        bHabit.lastCompletionDate = Date(timeIntervalSinceNow: TimeInterval(-day))
        bHabit.currentStreak = 100
        
        var cHabit = Habit(title: "hahaha", image: .forest)
        cHabit.lastCompletionDate = Date(timeIntervalSinceNow: 0)
        cHabit.currentStreak = 100
        
        persistance.habits = [
            aHabit,
            bHabit,
            cHabit
        ]
        
        persistance.updateHabitStreaks()
        
        setupNavBar()
        
        tableView.register(
            HabitTableViewCell.nib,
            forCellReuseIdentifier: HabitTableViewCell.identifier
        )
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        persistance.setNeedsToReloadHabits()
        tableView.reloadData()
    }
}

// MARK: - Navigation Bar Code

extension HabitsTableViewController {
    
    func setupNavBar() {
        title = "Habitual"
        
        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(pressAddHabit(_:)))
        navigationItem.rightBarButtonItem = addButton
        
        navigationItem.leftBarButtonItem = self.editButtonItem
    }
    
    @objc func pressAddHabit(_ sender: UIBarButtonItem) {
        let addHabitVc = AddHabitViewController.instantiate()
        let navigationController = UINavigationController(rootViewController: addHabitVc)
        present(navigationController, animated: true, completion: nil)
        
    }
}

