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
    @IBOutlet weak var scrollImg: UIImageView!
    @IBOutlet weak var container: UIView!
    
    //MARK: awakeFromNib
    override func awakeFromNib() {
        super.awakeFromNib()
        scrollImg.layer.cornerRadius = 20
        scrollImg.clipsToBounds = true
    }
}
