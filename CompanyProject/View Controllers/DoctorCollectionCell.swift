//
//  doctorCollectionCell.swift
//  CompanyProject
//
//  Created by Tosif Bhatti on 10/04/23.
//

import UIKit

struct collectionData {
    var imageIcone: String
    var specialization: String
}

class DoctorCollectionCell: UICollectionViewCell {
    

    @IBOutlet weak var specializeIcone: UIImageView!
    @IBOutlet weak var lblSpecialization: UILabel!
    
    static var collectionIdentifier = "doctorCollectionCell"
    
    func configure(detail: collectionData) {
        specializeIcone.image = UIImage(named: detail.imageIcone)
        lblSpecialization.text = detail.specialization
    }
}
