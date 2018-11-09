//
//  DateExtensions.swift
//  Habitual
//
//  Created by Erick Sanchez on 11/8/18.
//  Copyright © 2018 Sam Galizia. All rights reserved.
//

import Foundation

extension Date {
    var stringValue: String {
        return DateFormatter.localizedString(from: self, dateStyle: .medium, timeStyle: .none)
    }
    
    var isToday: Bool {
        let calendar = Calendar.current
        
        return calendar.isDateInToday(self)
    }
    
    var isYesterday: Bool {
        let calendar = Calendar.current
        
        return calendar.isDateInYesterday(self)
    }
}
