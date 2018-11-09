//
//  AlertViewControllerExtensions.swift
//  Habitual
//
//  Created by Erick Sanchez on 11/9/18.
//  Copyright © 2018 Sam Galizia. All rights reserved.
//

import UIKit.UIAlertController

extension UIAlertController {
    convenience init(habitTitle: String, comfirmHandler: @escaping () -> Void) {
        self.init(title: "Delete Habit", message: "Are you sure you want to delete \(habitTitle)?", preferredStyle: .actionSheet)
        
        let confirmAction = UIAlertAction(title: "Confirm", style: .destructive) { _ in
            comfirmHandler()
        }
        self.addAction(confirmAction)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        self.addAction(cancelAction)
    }
}
