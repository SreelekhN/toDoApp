//
//  AddReminderViewController.swift
//  to-Do App
//
//  Created by Exalture Software Labs on 24/09/19.
//  Copyright © 2019 Sreelekh N. All rights reserved.
//

import UIKit

class AddReminderViewController: CommonViewController, pickedCalenderDate {
    func calenderDatePicked(_ Date: String) {
        SharedAlertController.sharedAlert.alertdelegate = self
        reminderDateBtn.setTitle(Date.getDateFromString(), for: .normal)
        self.viewModel.reminderDate = Date.getDateFromString()
    }
    
    let viewModel = AddReminderViewModel()
    
    @IBOutlet weak var reminderNoteTF: UITextField!
    @IBOutlet weak var reminderDateBtn: UIButton!
    @IBOutlet weak var timeTF: UITextField!
    var timePickerView : UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        setUI()
        
    }
    
    func setUI() {
        
        if param?["edit"] as? Bool == true {
            if let model = param?["selected"] as? Reminder {
                
                self.viewModel.reminderDate = model.reminderDate
                self.viewModel.reminderHeading = model.reminderTitle
                self.viewModel.reminderTime = model.reminderTime
                reminderDateBtn.setTitle(model.reminderDate, for: .normal)
                reminderNoteTF.text = self.viewModel.reminderHeading
                timeTF.text = self.viewModel.reminderTime
                
            }
        }else {
            
            reminderDateBtn.setTitle(param?["today"] as? String, for: .normal)
            self.viewModel.reminderDate = param?["today"] as? String ?? ""
            
        }
        reminderNoteTF.addTarget(self, action: #selector(myTargetFunction), for: .editingChanged)
        self.createPicker(timeTF)
    }
    
    @IBAction func reminderDateBtnAction(_ sender: UIButton) {
        if let modelVC = self.storyboard?.instantiateViewController(withIdentifier: storyboardIdentifier.CalenderViewController) as? CalenderViewController {
            modelVC.viewModel.calenderDatePass = self
            self.present(modelVC, animated:true, completion: nil)
        }
    }
    
    @IBAction func saveBtnAction(_ sender: UIButton) {
        verifyData()
    }
    
    @IBAction func backBtnAction(_ sender: UIButton) {
        menuDismiss()
    }
    
    @objc func myTargetFunction(textField: UITextField) {
        self.viewModel.reminderHeading = textField.text ?? ""
    }
    
    func verifyData() {
        guard self.viewModel.reminderHeading.trimmingCharacters(in: .whitespaces).count > 0 else {
            return showToast(message: AppAlertMsg.ENTER_TITLE)
        }
        guard self.viewModel.reminderTime.trimmingCharacters(in: .whitespaces).count > 0 else {
            return showToast(message: AppAlertMsg.SELECT_TIME)
        }
        updateData()
    }
    
    func updateData () {
        
        let realm = try! Realm()
        if param?["edit"] as? Bool == true {
            let reminderItem = Reminder()
            if let model = param?["selected"] as? Reminder {
                reminderItem.id = model.id
            }
            reminderItem.reminderTitle = self.viewModel.reminderHeading
            reminderItem.reminderDate = self.viewModel.reminderDate
            reminderItem.reminderTime = self.viewModel.reminderTime
            reminderItem.reminderStatus = true
            try! realm.write {
                realm.add(reminderItem, update: .modified)
            }
            
        }else{
            let reminderItem = Reminder()
            reminderItem.id = self.viewModel.reminderHeading
            reminderItem.reminderTitle = self.viewModel.reminderHeading
            reminderItem.reminderDate = self.viewModel.reminderDate
            reminderItem.reminderTime = self.viewModel.reminderTime
            reminderItem.reminderStatus = true
            try! realm.write {
                realm.add(reminderItem, update: .modified)
            }
        }
        DispatchQueue.main.async {
            
        
        self.param?["edit"] as? Bool == true ? (SharedAlertController.sharedAlert.createMsgAlert(Title: AppDetails.APP_NAME, Message: AppAlertMsg.REMINDER_LIST_UPDATED, Style: .alert, OKTitle: AppButtonTitles.okTitle, completion: {
            self.menuDismiss()
        })) : (SharedAlertController.sharedAlert.createMsgAlert(Title: AppDetails.APP_NAME, Message: AppAlertMsg.REMINDER_ADDED, Style: .alert, OKTitle: AppButtonTitles.okTitle, completion: {
            self.menuDismiss()
        }))
        }
    }
    
    
}
