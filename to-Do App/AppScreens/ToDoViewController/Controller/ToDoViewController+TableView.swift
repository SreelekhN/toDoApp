//
//  ToDoViewController+TableView.swift
//  to-Do App
//
//  Created by Exalture Software Labs on 24/09/19.
//  Copyright © 2019 Sreelekh N. All rights reserved.
//

import Foundation

extension ToDoViewController : UITableViewDataSource, UITableViewDelegate { 
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        self.viewModel.cellHeights[indexPath] = cell.frame.size.height
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return self.viewModel.cellHeights[indexPath] ?? 70.0
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        switch self.viewModel.tabToLoad {
        case 0:
            print("none")
        case 1:
            if let headerCell = tableView.dequeueReusableCell(withIdentifier: ProjectCellIdentifier.REMIDER_HEADER) as? ToDoTableViewCell {
                headerCell.headerLbl.text = self.viewModel.titleArray[section]
                return headerCell.contentView
            }
        default:
            break
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        switch self.viewModel.tabToLoad {
        case 0:
            return 10
        case 1:
            return 47
        default:
            break
        }
        return 0
        
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        
        switch self.viewModel.tabToLoad {
        case 0:
            return 80
        case 1:
            return section == self.viewModel.getMonthSectionCount() - 1 ? 80 : 7
        default:
            break
        }
        return 0
    }
    func numberOfSections(in tableView: UITableView) -> Int{
        switch self.viewModel.tabToLoad {
        case 0:
            return 1
        case 1:
            return self.viewModel.getMonthSectionCount()
        default:
            break
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        switch self.viewModel.tabToLoad {
        case 0:
            return self.viewModel.getDayTabCount()
        case 1:
            return self.viewModel.getMonthRowCount(section)
        default:
            break
        }
        return 0
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: ProjectCellIdentifier.REMINDER_CELL, for: indexPath) as? ToDoTableViewCell {
            cell.clipsToBounds = true
            cell.layoutSubviews()
            cell.layoutIfNeeded()
            cell.switchBtn.tag = (indexPath.section * 1000) + indexPath.row
            cell.randomClrView.backgroundColor = generateRandomClr(indexValue: indexPath.row)
            switch self.viewModel.tabToLoad {
            case 0:
                cell.loadCellData(Data:self.viewModel.remindersList[indexPath.row])
            case 1:
                cell.loadCellData(Data:self.viewModel.byMonthCategory[indexPath.section][indexPath.row])
            default:
                break
            }
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        switch self.viewModel.tabToLoad {
        case 0:
            let item = self.viewModel.remindersList[indexPath.row]
            self.presentVC(name: storyboardIdentifier.AddReminderViewController, with: ["selected":item,"edit":true])
        case 1:
            let index = self.viewModel.remindersList.index(of: self.viewModel.mappedMonth[indexPath.section][indexPath.row])
            if let item = self.viewModel.remindersList?[index ?? 0] {
                self.presentVC(name: storyboardIdentifier.AddReminderViewController, with: ["selected":item,"edit":true])
            }
            
        default:
            break
        }
    }
    
    //MARK: - Adding Swipe To Delete
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        
        return true
    }
    
    //MARK: - Swipe To Delete image
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration?
    {
        let deleteAction = UIContextualAction(style: .destructive, title: "") { (action, view, handler) in
            
            switch self.viewModel.tabToLoad {
            case 0:
                let item = self.viewModel.remindersList[indexPath.row]
                let realm = try! Realm()
                try! realm.write {
                    realm.delete(item)
                }
            case 1:
                let index = self.viewModel.remindersList.index(of: self.viewModel.mappedMonth[indexPath.section][indexPath.row])
                if let item = self.viewModel.remindersList?[index ?? 0] {
                    let realm = try! Realm()
                    try! realm.write {
                        realm.delete(item)
                    }
                }
            default:
                break
            }
            self.setUI()
        }
        deleteAction.backgroundColor = UIColor.red
        deleteAction.image = UIGraphicsImageRenderer(size: CGSize(width: 30, height: 30)).image { _ in
            UIImage(named: "deleteImage")?.draw(in: CGRect(x: 0, y: 0, width: 30, height: 30))
        }
        let configuration = UISwipeActionsConfiguration(actions: [deleteAction])
        configuration.performsFirstActionWithFullSwipe = false //HERE..
        return configuration
    }
}
