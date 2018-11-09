//
//  Habit.swift
//  Habitual
//
//  Created by Erick Sanchez on 11/1/18.
//  Copyright © 2018 Sam Galizia. All rights reserved.
//

import Foundation
import UIKit.UIImage

struct Habit: Codable {
    enum Images: Int, Codable, CaseIterable {
        case outdoors
        case forest

        var image: UIImage {
            guard let image = UIImage(named: String(describing: self)) else {
                fatalError("image \(self) not found")
            }

            return image
        }
    }

    // Initalizing out here beacuse they are static values
    var title: String
    let dateCreated: Date = Date()
    var selectedImage: Images

    var currentStreak: Int = 0
    var bestStreak: Int = 0
    var lastCompletionDate: Date?
    var numberOfCompletions: Int = 0

    var hasCompletedForToday: Bool {
        return lastCompletionDate?.isToday ?? false
    }

    init(title: String, image: Images) {
        self.title = title
        self.selectedImage = image
    }
}
