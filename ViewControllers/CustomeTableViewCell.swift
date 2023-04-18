//
//  CustomeTableViewCell.swift
//  CompanyProject
//
//  Created by Tosif Bhatti on 22/03/23.
//

import UIKit
struct LeaveData {
    let request: String
    let start: String
    let end: String
    let status: String
    let action: String
    let reason: String
}

class CustomeTableViewCell: UITableViewCell {
    
    @IBOutlet weak var requestDate: UILabel!
    @IBOutlet weak var startDate: UILabel!
    @IBOutlet weak var endDate: UILabel!
    @IBOutlet weak var status: UILabel!
    @IBOutlet weak var actiontaken: UILabel!
    @IBOutlet weak var reason: UILabel!
    
    func configure(data: LeaveData) {
        requestDate.text = data.request
        startDate.text = data.start
        endDate.text = data.end
        status.text = data.status
        actiontaken.text = data.action
        reason.text = data.reason
    }

}
