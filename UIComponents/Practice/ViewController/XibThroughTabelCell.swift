//
//  xibThroughTabelCell.swift
//  CompanyProject
//
//  Created by Tosif Bhatti on 07/04/23.
//

import UIKit

class XibThroughTabelCell: UITableViewCell {

    //MARK: Outlets
    @IBOutlet private weak var imgInxib: UIImageView!
    @IBOutlet private weak var lblInxib: UILabel!
    
    //MARK: LifeCycle
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    //MARK: Configure Cell
    func configure(img: String, lbl: String) {
        imgInxib.image = UIImage(named: img)
        lblInxib.text = lbl
    }
}
