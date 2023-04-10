//
//  doctorDetailTableCell.swift
//  CompanyProject
//
//  Created by Tosif Bhatti on 10/04/23.
//

import UIKit

struct tableData {
    var cellImage: String
    var drName: String
    var specialization: String
    var address: String
    var ratinf: String
}
class DoctorDetailTableCell: UITableViewCell {
    
    static var tableIdentifier = "doctorTableCell"


    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure(detail: tableData) {
        
    }

}
