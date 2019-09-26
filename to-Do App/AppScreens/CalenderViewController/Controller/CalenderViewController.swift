//
//  CalenderViewController.swift
//  to-Do App
//
//  Created by Exalture Software Labs on 24/09/19.
//  Copyright © 2019 Sreelekh N. All rights reserved.
//

import UIKit
import FSCalendar

class CalenderViewController: CommonViewController, FSCalendarDataSource, FSCalendarDelegate {
    
    let viewModel = CalenderViewModel()

    @IBOutlet weak var calender: FSCalendar!
    
    fileprivate let formatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy/MM/dd"
        return formatter
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        calender.dataSource = self
        calender.delegate = self
        
    }

    @IBAction func okBtnAction(_ sender: UIButton) {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        let day = formatter.string(from: self.viewModel.selectedDate)
        self.viewModel.calenderDatePass?.calenderDatePicked(day)
        menuDismiss()
    }
    @IBAction func cancelBtnAction(_ sender: Any) {
        menuDismiss()
    }
    
    func minimumDate(for calendar: FSCalendar) -> Date {
        return Date().currentDay()
    }
    
    func maximumDate(for calendar: FSCalendar) -> Date {
        let _calendar = Calendar.current
        var dateComponents = DateComponents()
        dateComponents.month = 12 // For next button
        return _calendar.date(byAdding: dateComponents, to: Date().endOfMonth())!
    }
    
    // MARK:- FSCalendarDelegate
    
    func calendarCurrentPageDidChange(_ calendar: FSCalendar) {
        print("change page to \(self.formatter.string(from: calendar.currentPage))")
        
    }
    
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
        print("calendar did select date \(self.formatter.string(from: date))")
        self.viewModel.selectedDate = date
        if monthPosition == .previous || monthPosition == .next {
            calendar.setCurrentPage(date, animated: true)
        }
    }
    
}
