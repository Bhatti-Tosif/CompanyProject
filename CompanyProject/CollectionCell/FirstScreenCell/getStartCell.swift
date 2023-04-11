//
//  getStartCell.swift
//  CompanyProject
//
//  Created by Tosif Bhatti on 11/04/23.
//

import UIKit

struct GetStartData {
    var startImg: String
    var lblTitle: String
    var lblSubtitle: String
}
class getStartCell: UICollectionViewCell {
    static let identifier = "getStartCell"
    
    
    //MARK: Outlets
    @IBOutlet weak var imgForStartScreen: UIImageView!
    @IBOutlet weak var lblForTitle: UILabel!
    @IBOutlet weak var lblForSubtitle: UILabel!
    
    override class func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configure(detail: GetStartData) {
        imgForStartScreen.image = UIImage(named: detail.startImg)
        lblForTitle.text = detail.lblTitle
        lblForSubtitle.text = detail.lblSubtitle
    }
}
