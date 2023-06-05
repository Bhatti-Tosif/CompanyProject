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
    @IBOutlet private weak var headerText: UILabel!
    @IBOutlet private weak var sectionMessage: UILabel!
    @IBOutlet private weak var openedDate: UILabel!
    @IBOutlet private weak var headerView: UIView!
    @IBOutlet private weak var sectionView: UIView!
    @IBOutlet private weak var upButton: UIImageView!
    @IBOutlet private weak var downImage: UIImageView!
    
    //MARK: LifeCycle
    override func awakeFromNib() {
        super.awakeFromNib()
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
            headerView.backgroundColor = R.color.whiteThree()
            upButton.isHidden = true
            downImage.isHidden = false
        }

    }

    //MARK: Configure Cell
    func configureTask(task: SectionHeader) {
        headerText.text = task.headerName
        sectionMessage.text = task.sectionMessage
        openedDate.text = task.openedDate
    }
}
