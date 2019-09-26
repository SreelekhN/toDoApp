//
//  ToDoTableViewCell.swift
//  to-Do App
//
//  Created by Exalture Software Labs on 24/09/19.
//  Copyright © 2019 Sreelekh N. All rights reserved.
//

import Foundation

class ToDoTableViewCell : UITableViewCell {
    
    @IBOutlet weak var headerLbl: UILabel!
    @IBOutlet weak var switchBtn: UISwitch!
    @IBOutlet weak var timeLbl: UILabel!
    @IBOutlet weak var toDoLbl: UILabel!
    @IBOutlet weak var randomClrView: UIView!
    @IBOutlet weak var contentBackView: UIView!
    
    func loadCellData(Data:Reminder) {
        toDoLbl.text = Data.reminderTitle
        timeLbl.text = Data.reminderTime
        Data.reminderStatus == true ? (switchBtn.isOn = true) : (switchBtn.isOn = false)
    }
    
}

