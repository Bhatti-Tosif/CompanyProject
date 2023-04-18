//
//  InviteWizardCollectionCellCollectionViewCell.swift
//  CompanyProject
//
//  Created by Tosif Bhatti on 27/03/23.
//

import UIKit

struct CollectionLogo {
    var logoIcone: String
}

class InviteWizardCollectionCellCollectionViewCell: UICollectionViewCell {
    
    //MARK: All Outlet
    @IBOutlet weak var mediaLogo: UIImageView!
    
   // navigationSet()
    
    //MARK: Configure Cell
    func configure(icone: CollectionLogo) {
        mediaLogo.image = UIImage(named: icone.logoIcone)
    }
}
