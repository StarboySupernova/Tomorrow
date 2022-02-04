//
//  ViewController.swift
//  Tomorrow
//
//  Created by Simbarashe Dombodzvuku on 2/3/22.
//

import UIKit

class ReminderListViewController: UITableViewController {
    
}

extension ReminderListViewController {
    
    static let reminderListCellIdentifier = "ReminderListCell"
    //The identifier determines which cell to display in the table row. Recall that in Connecting Outlets and Actions, you added the identifier in Interface Builder when you created the objects for this cell.
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Reminder.testData.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        /*
         Override the tableView(_:cellForRowAt:) method to dequeue a cell based on the cell identifier.
         Dequeuing a cell optimizes performance because it returns a reusable cell, rather than displaying and removing each cell instance. Dequeuing ensures that table views perform well even when processing vast quantities of data.
         */
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Self.reminderListCellIdentifier, for: indexPath) as? ReminderListCell else {
            fatalError("Unable to dequeue ReminderCell")
        }
        //Retrieve the test reminder that corresponds to the row in the table.
        let reminder = Reminder.testData[indexPath.row]
        //Add an image constant that holds an empty circle for incomplete reminders or a filled circle for complete reminders.
        let image = reminder.isComplete ? UIImage(systemName: "circle.fill") : UIImage(systemName: "circle")
        //Configure the title label and date label using reminder, then return the cell.
        cell.titleLabel.text = reminder.title
        cell.dateLabel.text = reminder.dueDate.description
        //Update the Done button to display the appropriate completion status.
        cell.doneButton.setBackgroundImage(image, for: .normal)
        //Provide a closure for the doneButtonAction in the cell row and call toggle on the reminder.
        cell.doneButtonAction = {
            Reminder.testData[indexPath.row].isComplete.toggle()
            //Reload the table rows for completed reminders.
            tableView.reloadRows(at: [indexPath], with: .none)
        }
        return cell
        
    }
    
}

