//
//  TabelCellPractice.swift
//  CompanyProject
//
//  Created by Tosif Bhatti on 07/04/23.
//

import UIKit

class TabelCellPractice: UITableViewCell {

    //MARK: Outlets
    @IBOutlet private weak var imageForCell: UIImageView!
    @IBOutlet private weak var labelForCell: UILabel!
    
    //MARK: LifeCycle
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    //MARK: Configure Cell
    func configure(imageItem: String, labelItem: String) {
        imageForCell.image = UIImage(named: imageItem)
        labelForCell.text = labelItem
    }
}
