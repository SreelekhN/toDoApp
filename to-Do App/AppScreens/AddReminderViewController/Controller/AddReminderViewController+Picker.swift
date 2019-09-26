//
//  AddReminderViewController+Picker.swift
//  to-Do App
//
//  Created by Exalture Software Labs on 25/09/19.
//  Copyright © 2019 Sreelekh N. All rights reserved.
//

import Foundation
extension AddReminderViewController {
    func createPicker(_ textField : UITextField){
        // UIDatePicker
        self.timePickerView = UIDatePicker(frame:CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 216))
        self.timePickerView.datePickerMode = .time
        self.timePickerView.backgroundColor = UIColor.white
        textField.inputView = self.timePickerView
        timePickerView.addTarget(self, action: #selector(handleTimePicker(sender:)), for: .valueChanged)
        
        // ToolBar
        let toolBar = UIToolbar()
        toolBar.barStyle = .default
        toolBar.isTranslucent = true
        toolBar.tintColor = UIColor(red: 92/255, green: 216/255, blue: 255/255, alpha: 1)
        toolBar.sizeToFit()
        
        // Adding Button ToolBar
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(AddReminderViewController.doneClick))
        doneButton.tintColor = UIColor.black
        let spaceButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let cancelButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(AddReminderViewController.cancelClick))
        cancelButton.tintColor = UIColor.black
        toolBar.setItems([cancelButton, spaceButton, doneButton], animated: false)
        toolBar.isUserInteractionEnabled = true
        textField.inputAccessoryView = toolBar
    }
    @objc func doneClick(_ textField : UITextField) {
        self.view.endEditing(true)
    }
    @objc func cancelClick(_ textField : UITextField) {
        self.view.endEditing(true)
    }
    
    @objc func handleTimePicker(sender: UIDatePicker) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm a"
        self.viewModel.reminderTime = dateFormatter.string(from: sender.date)
        timeTF.text = self.viewModel.reminderTime
    }
    
}

