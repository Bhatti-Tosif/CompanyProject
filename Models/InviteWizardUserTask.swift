//
//  InviteWizardUserTask.swift
//  CompanyProject
//
//  Created by Tosif Bhatti on 28/03/23.
//

import UIKit

struct SectionHeader {
    var headerName: String
    var sectionMessage: String
    var openedDate: String
}
class InviteWizardUserTask: UITableViewCell {

    //MARK: Outlets
    @IBOutlet weak var headerText: UILabel!
    @IBOutlet weak var sectionMessage: UILabel!
    @IBOutlet weak var openedDate: UILabel!
    
    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var sectionView: UIView!
    
    @IBOutlet weak var upButton: UIImageView!
    @IBOutlet weak var downImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        sectionView.isHidden = true
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        if selected {
            sectionView.isHidden = false
            downImage.isHidden = true
            upButton.isHidden = false
        } else {
            sectionView.isHidden = true
            headerView.backgroundColor = UIColor(named: "white - Three")
            upButton.isHidden = true
            downImage.isHidden = false
        }

        // Configure the view for the selected state
    }

    func configureTask(task: SectionHeader) {
        headerText.text = task.headerName
        sectionMessage.text = task.sectionMessage
        openedDate.text = task.openedDate
    }
}
