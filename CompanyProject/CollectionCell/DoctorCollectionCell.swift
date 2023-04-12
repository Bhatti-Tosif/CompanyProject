//
//  doctorCollectionCell.swift
//  CompanyProject
//
//  Created by Tosif Bhatti on 10/04/23.
//

import UIKit

//MARK: Structure for Detail
struct collectionData {
    var imageIcone: String
    var specialization: String
}

class DoctorCollectionCell: UICollectionViewCell {
    
    //MARK: Outlets
    @IBOutlet weak var specializeIcone: UIImageView!
    @IBOutlet weak var lblSpecialization: UILabel!
    
    //MARK: Variable Declarations
    static var collectionIdentifier = "doctorCollectionCell"
    
    //MARK: awakeFromNib
    override func awakeFromNib() {
        super.awakeFromNib()
        specializeIcone.layer.cornerRadius = specializeIcone.frame.size.height / 2 - 15
    }
    
    //MARK: Cell Configure Functions
    func configure(detail: collectionData) {
        specializeIcone.image = UIImage(named: detail.imageIcone)
        lblSpecialization.text = detail.specialization
    }
}
