//
//  ScrollImageCell.swift
//  CompanyProject
//
//  Created by Tosif Bhatti on 11/04/23.
//

import UIKit

class ScrollImageCell: UICollectionViewCell {
    
    //MARK: Variable Declarations
    static var imgCellIdentifier = "scrollImageCell"
    
    //MARK: Outlets
    @IBOutlet weak var imgScrolling: UIImageView!
    @IBOutlet weak var containerView: UIView!
    
    //MARK: awakeFromNib
    override func awakeFromNib() {
        super.awakeFromNib()
        imgScrolling.layer.cornerRadius = ConstantHandle.imgScrollingCornerRadius
        imgScrolling.clipsToBounds = true
    }
}
