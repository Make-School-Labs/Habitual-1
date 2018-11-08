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
    
    private(set) var habits: [Habit] = []
    
    init() {
        self.loadHabits()
    }
    
    // MARK: - RETURN VALUES
    
    // MARK: - METHODS
    
    //add new habit
    mutating func createNewHabit(name: String, image: Habit.Images) -> Habit {
        let newHabit = Habit(title: name, image: image)
        self.habits.insert(newHabit, at: 0)
        self.saveHabits()
        
        return newHabit
    }
    
    //mark habit complete
    mutating func markHabitAsCompleted(_ habitIndex: Int) {
        var updatedHabit = self.habits[habitIndex]
        
        //update completion count
        updatedHabit.numberOfCompletions += 1
        
        //update current streak
        if let lastCompletionDate = updatedHabit.lastCompletionDate, lastCompletionDate.isYesterday {
            updatedHabit.currentStreak += 1
        } else {
            updatedHabit.currentStreak = 0
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
    }
    
    //delete habit
    
    //load
    private func loadHabits() {
        
    }
    
    //save
    private func saveHabits() {
        
    }
}
