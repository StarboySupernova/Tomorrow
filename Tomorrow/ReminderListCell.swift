//
//  ReminderListCell.swift
//  Tomorrow
//
//  Created by Simbarashe Dombodzvuku on 2/4/22.
//

import UIKit

class ReminderListCell: UITableViewCell {
    
    typealias DoneButtonAction = () -> Void
    
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var dateLabel: UILabel!
    @IBOutlet var doneButton: UIButton!
    
    var doneButtonAction: DoneButtonAction?
    
    @IBAction func doneButtonTriggered(_sender: UIButton){
        doneButtonAction?()
    }
}
