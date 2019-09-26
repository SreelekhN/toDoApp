//
//  ViewController.swift
//  to-Do App
//
//  Created by Exalture Software Labs on 24/09/19.
//  Copyright © 2019 Sreelekh N. All rights reserved.
//

import UIKit
import TransitionButton


class ToDoViewController: CommonViewController, UIViewControllerTransitioningDelegate {
    
    let viewModel = ToDoViewModel()
    
    @IBOutlet weak var toDoTableView: UITableView!
    @IBOutlet weak var todayBtn: UIButton!
    @IBOutlet weak var toDoBtn: TransitionButton!
    @IBOutlet weak var monthBtn: UIButton!
    @IBOutlet weak var todayTitle: UILabel!{
        didSet{
            let date = Date()
            let formatter = DateFormatter()
            formatter.dateFormat = "yyyy-MM-dd"
            let day = formatter.string(from: date)
            self.viewModel.today = day.getDateFromString()
            todayTitle.text = self.viewModel.today
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        changeButtonLay(0)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        setUI()
    }
    
    func setUI(){
        let loadAsQ = DispatchGroup()
        loadAsQ.enter()
        self.viewModel.getDbDataSorted()
        self.toDoTableView.reloadData()
        loadAsQ.leave()
    }
    
    @IBAction func todayBtnAction(_ sender: UIButton) {
        DispatchQueue.main.async {
            self.viewModel.tabToLoad = 0
            self.changeButtonLay(0)
            self.setUI()
            
        }
    }
    
    @IBAction func monthBtnAction(_ sender: UIButton) {
        DispatchQueue.main.async {
            self.viewModel.tabToLoad = 1
            self.changeButtonLay(1)
            self.setUI()
        }
    }
    
    @IBAction func switchBtnAction(_ sender: UISwitch) {
        
        let row = sender.tag % 1000
        let section = sender.tag / 1000
        
        let realm = try! Realm()
        switch self.viewModel.tabToLoad {
        case 0:
            try! realm.write {
                self.viewModel.remindersList[row].reminderStatus == true ? (self.viewModel.remindersList[row].reminderStatus = false) : (self.viewModel.remindersList[row].reminderStatus = true)
            }
            self.showToast(message: AppAlertMsg.REMINDER_STATUS_CHANGED + self.viewModel.remindersList[row].reminderTitle)
        case 1:
            let index = self.viewModel.remindersList.index(of: self.viewModel.byMonthCategory[section][row])
            try! realm.write {
                self.viewModel.remindersList?[index ?? 0].reminderStatus == true ? (self.viewModel.remindersList?[index ?? 0].reminderStatus = false) : (self.viewModel.remindersList?[index ?? 0].reminderStatus = true)
            }
            self.showToast(message: AppAlertMsg.REMINDER_STATUS_CHANGED + (self.viewModel.remindersList?[index ?? 0].reminderTitle ?? ""))
        default:
            break
        }
        self.toDoTableView.reloadData()
    }
    
    @IBAction func addToDoBtnAction(_ sender: TransitionButton) {
        toDoBtn.startAnimation()
        let qualityOfServiceClass = DispatchQoS.QoSClass.background
        let backgroundQueue = DispatchQueue.global(qos: qualityOfServiceClass)
        backgroundQueue.async(execute: {
            DispatchQueue.main.async(execute: { () -> Void in
                self.toDoBtn.stopAnimation(animationStyle: .expand, completion: {
                    self.presentVC(name: storyboardIdentifier.AddReminderViewController, with: ["today":self.viewModel.today,"edit":false])
                })
            })
        })
    }
    
    func changeButtonLay(_ section:Int)
    {
        switch section {
        case 0:
            DispatchQueue.main.async {
                
                self.todayBtn.backgroundColor = UIColor.appBtnSelected()
                self.todayBtn.titleLabel?.textColor = UIColor.black
                self.monthBtn.backgroundColor = UIColor.clear
                self.monthBtn.titleLabel?.textColor = UIColor.white
            }
            
        case 1:
            DispatchQueue.main.async {
                
                self.monthBtn.backgroundColor = UIColor.appBtnSelected()
                self.monthBtn.titleLabel?.textColor = UIColor.black
                self.todayBtn.backgroundColor = UIColor.clear
                self.todayBtn.titleLabel?.textColor = UIColor.white
            }
        default:
            print("nil")
        }
    }
    
}

extension Sequence {
    func group<U: Hashable>(by key: (Iterator.Element) -> U) -> [U:[Iterator.Element]] {
        return Dictionary.init(grouping: self, by: key)
    }
}
