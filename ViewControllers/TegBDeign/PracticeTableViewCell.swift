//
//  PracticeTableViewCell.swift
//  CompanyProject
//
//  Created by Tosif Bhatti on 23/03/23.
//

import UIKit

class PracticeTableViewCell: UITableViewCell {
    
    //MARK: Outlets
    @IBOutlet  weak var stateLable: UILabel!
    @IBOutlet  weak var cityLable: UILabel!
    
    //MARK: LifeCycle
    override func awakeFromNib() {
        super.awakeFromNib()
        accessoryView = UIView(frame: CGRect(x: 0, y: 0, width: 30, height: 30))
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
