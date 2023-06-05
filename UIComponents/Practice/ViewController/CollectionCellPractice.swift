//
//  CollectionCellPractice.swift
//  CompanyProject
//
//  Created by Tosif Bhatti on 07/04/23.
//

import UIKit

class CollectionCellPractice: UICollectionViewCell {
 
    //MARK: Outlets
    @IBOutlet private weak var imgForCollectionCell: UIImageView!
    
    //MARK: LifeCycle
    override class func awakeFromNib() {
        super.awakeFromNib()
    }

    //MARK: Configure Cell
    func configure(setImage: String) {
        imgForCollectionCell.image = UIImage(named: setImage)
    }
}
