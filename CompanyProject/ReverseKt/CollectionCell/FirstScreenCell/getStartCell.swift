//
//  getStartCell.swift
//  CompanyProject
//
//  Created by Tosif Bhatti on 11/04/23.
//

import UIKit

class getStartCell: UICollectionViewCell {
    
    //MARK: Variable Declaration
    static let identifier = "getStartCell"
    
    //MARK: Outlets
    @IBOutlet weak var imgForStartScreen: UIImageView!
    @IBOutlet weak var lblForTitle: UILabel!
    @IBOutlet weak var lblForSubtitle: UILabel!
    
    //MARK: awakeFromNib
    override class func awakeFromNib() {
        super.awakeFromNib()
    }
    
}

//MARK: Extension for configureFunction
extension getStartCell {
    
    //MARK: Cell Configure Methods
    func configure(detail: GetStartData) {
        imgForStartScreen.image = UIImage(named: detail.startImg)
        lblForTitle.text = detail.lblTitle
        lblForSubtitle.text = detail.lblSubtitle
    }
}
