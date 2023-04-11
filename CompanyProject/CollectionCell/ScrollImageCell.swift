//
//  ScrollImageCell.swift
//  CompanyProject
//
//  Created by Tosif Bhatti on 11/04/23.
//

import UIKit

class ScrollImageCell: UICollectionViewCell {
    
    static var imgCellIdentifier = "scrollImageCell"
    
    @IBOutlet weak var scrollImg: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}
