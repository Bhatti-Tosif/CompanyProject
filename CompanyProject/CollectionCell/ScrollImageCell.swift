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
    
    
    @IBOutlet weak var container: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        container.layer.cornerRadius = 100
        //contentView.layer.masksToBounds = false
        container.clipsToBounds = true
        self.layer.cornerRadius = 20
        self.clipsToBounds = true
        print(container.layer.cornerRadius)
    }
}
