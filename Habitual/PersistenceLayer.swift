//
//  PersistenceLayer.swift
//  Habitual
//
//  Created by Erick Sanchez on 11/8/18.
//  Copyright © 2018 Sam Galizia. All rights reserved.
//

import Foundation

struct PersistenceLayer {
    
    // MARK: - VARS
    
    private(set) var habits: [Habit] = [] // Can only read to the array of habits can't write to it
    
    private static let userDefaultsHabitsKeyValue = "HABITS_ARRAY"
    
    init() {
        self.loadHabits()
    }
    
    // MARK: - RETURN VALUES
    
    //Using a discardable result becuase we are returning a value that we are not using
    @discardableResult
    mutating func createNewHabit(name: String, image: Habit.Images) -> Habit {
        let newHabit = Habit(title: name, image: image)
        self.habits.insert(newHabit, at: 0) // Prepend the habits to the array
        self.saveHabits()
        
        return newHabit
    }
    
    // MARK: - METHODS
    
    //mark habit complete
    mutating func markHabitAsCompleted(_ habitIndex: Int) -> Habit {
        var updatedHabit = self.habits[habitIndex] // Getting the current habbit to be marked
        
        // If the habit's status was changes return the updated habit
        guard updatedHabit.hasCompletedForToday == false else { return updatedHabit }
        
        //update completion count
        updatedHabit.numberOfCompletions += 1
        
        //update current streak
        // The last completion date that we create is set to the updated habit's last completion date, then use that variable to be yesterday
        if let lastCompletionDate = updatedHabit.lastCompletionDate, lastCompletionDate.isYesterday {
            updatedHabit.currentStreak += 1
        } else {
            updatedHabit.currentStreak = 1
        }
        
        //update best streak
        if updatedHabit.currentStreak > updatedHabit.bestStreak {
            updatedHabit.bestStreak = updatedHabit.currentStreak
        }
        
        //update last completion date
        let now = Date()
        updatedHabit.lastCompletionDate = now
            
        self.habits[habitIndex] = updatedHabit
        self.saveHabits()
        
        return updatedHabit
    }
    
    //delete habit
    mutating func delete(_ habitIndex: Int) {
        self.habits.remove(at: habitIndex)
        self.saveHabits()
    }
    
    mutating func swapHabits(habitIndex: Int, destinationIndex: Int) {
        let habitToSwap = self.habits[habitIndex]
        self.habits.remove(at: habitIndex)
        self.habits.insert(habitToSwap, at: destinationIndex)
        self.saveHabits()
    }
    
    // Use mutating when you have to rewrite data to a property that is a value type
    mutating func setNeedsToReloadHabits() {
        self.loadHabits()
    }
    
    //load
    private mutating func loadHabits() {
        let userDefaults = UserDefaults.standard
        guard
            let habitData = userDefaults.data(forKey: PersistenceLayer.userDefaultsHabitsKeyValue),
            let habits = try? JSONDecoder().decode([Habit].self, from: habitData) else {
                return
        }
        
        self.habits = habits
    }
    
    //save
    private func saveHabits() {
        guard let habitsData = try? JSONEncoder().encode(self.habits) else {
            fatalError("could not encode list of habits")
        }
        
        let userDefaults = UserDefaults.standard
        userDefaults.set(habitsData, forKey: PersistenceLayer.userDefaultsHabitsKeyValue)
    }
}
