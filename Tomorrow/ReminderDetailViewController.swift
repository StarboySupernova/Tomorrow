//
//  ReminderDetailViewController.swift
//  Tomorrow
//
//  Created by Simbarashe Dombodzvuku on 2/4/22.
//

import UIKit

class ReminderDetailViewController: UITableViewController {
    enum ReminderRow: Int, CaseIterable{
        case title
        case date
        case time
        case notes
        
        func displayText(for reminder: Reminder?) -> String? {
            switch self {
            case .title:
                return reminder?.title
            case .date:
                return reminder?.dueDate.description
            case .time:
                return reminder?.dueDate.description
            case .notes:
                return reminder?.notes
            }
        }
        
        var cellImage: UIImage? {
            switch self {
            case .title:
                return nil
            case .date:
                return UIImage(systemName: "calendar.circle")
            case .time:
                return UIImage(systemName: "clock")
            case .notes:
                return UIImage(systemName: "square.and.pencil")
            }
        }
        
    }
    var reminder: Reminder?
    /*
     Create a method named configure that injects a reminder.
     
     When initializing a view controller from a storyboard, iOS calls the init(coder:) initializer. This configure method approach is useful for configuring after initializing, such as injecting dependencies.
     */
    func configure(with reminder: Reminder) {
        self.reminder = reminder
    }
}

extension ReminderDetailViewController {
    /*
     Add a constant for the cell identifier.
     
     Tip
     
     Always codify identifier strings to ensure your app doesn’t crash because of a mistyped identifier.
     */
    static let reminderDetailCellIdentifier = "ReminderDetailCell"
    /*
     Add an override for tableView(_:numberOfRowsInSection:).
     
     A table view asks its data source for the number of rows in a section when determining how many cells can be displayed on screen.
     */
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //In this case, the number of rows in the table view equals the number of cases in the enumeration.
        return ReminderRow.allCases.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Self.reminderDetailCellIdentifier, for: indexPath) //dequeuing a cell from a table view
        let row = ReminderRow(rawValue: indexPath.row)
        cell.textLabel?.text = row?.displayText(for: reminder)
        cell.imageView?.image = row?.cellImage
        return cell      //Because the enumeration encapsulates the displayText(for:) method and image property, the data source method can focus on cell configuration.
    }
}
