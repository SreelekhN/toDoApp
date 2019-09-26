//
//  ToDoViewModel.swift
//  to-Do App
//
//  Created by Exalture Software Labs on 24/09/19.
//  Copyright © 2019 Sreelekh N. All rights reserved.
//

import Foundation

class ToDoViewModel {
    
    var cellHeights: [IndexPath : CGFloat] = [:]
    var tabToLoad = 0
    var today = String()
    
    var remindersList: Results<Reminder>!
    var mappedMonth = [[Reminder]]()
    var grouped = [String : [Reminder]]()
    var titleArray = [String]()
    var byMonthCategory = [[Reminder]]()
    
    func getDbDataSorted() {
        let realm = try! Realm()
        remindersList = realm.objects(Reminder.self)
        grouped =  self.remindersList.group(by: { $0.reminderDate })
        self.mappedMonth = grouped.map { $0.value }
        getSectionTitle()
    }
    
    func getDayTabCount() -> Int {
        if remindersList.count > 0 {
            return remindersList.count
        }
        return 0
    }
    
    func getMonthSectionCount() -> Int {
        if titleArray.count > 0 {
            return titleArray.count
        }
        return 0
    }
    
    func getMonthRowCount(_ section:Int) -> Int {
        guard titleArray.count > section else {
            return 0
        }
        if byMonthCategory[section].count > 0 {
            return byMonthCategory[section].count
        }
        return 0
    }
    
    
    func getSectionTitle() {
        titleArray.removeAll()
        byMonthCategory.removeAll()
        grouped.forEach({ (child) in
            titleArray.append(child.key)
            byMonthCategory.append(child.value)
        })
        
    }
    
}
