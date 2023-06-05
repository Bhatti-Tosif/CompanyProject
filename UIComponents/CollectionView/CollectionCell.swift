//
//  CollectionCell.swift
//  CompanyProject
//
//  Created by Tosif Bhatti on 05/04/23.
//

import UIKit

class CollectionCell: UICollectionViewCell {
    
    //MARK: Outlets
    @IBOutlet private weak var collectionImage: UIImageView!
    @IBOutlet private weak var labelForImage: UILabel!
    
    //MARK: LifeCycle
    override class func awakeFromNib() {
        super.awakeFromNib()
    }
    
    //MARK: Configure Cell
    func confige(imageString: String, labelText: String) {
        collectionImage.image = UIImage(named: imageString)
        labelForImage.text = labelText
    }
}
