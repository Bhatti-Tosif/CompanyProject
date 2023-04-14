//
//  doctorCollectionCell.swift
//  CompanyProject
//
//  Created by Tosif Bhatti on 10/04/23.
//

import UIKit



class DoctorCollectionCell: UICollectionViewCell {
    
    //MARK: Outlets
    @IBOutlet weak var imgSpecializeIcone: UIImageView!
    @IBOutlet weak var lblSpecialization: UILabel!
    
    //MARK: Variable Declarations
    static var collectionIdentifier = "doctorCollectionCell"
    
    //MARK: awakeFromNib
    override func awakeFromNib() {
        super.awakeFromNib()
        //MARK: InitialSetUp call
        initialSetUp()
    }
    
}

//MARK: Extension for Initial SetUp
extension DoctorCollectionCell {
    //MARK: Initial SetUp
    func initialSetUp() {
        imgSpecializeIcone.layer.cornerRadius = imgSpecializeIcone.frame.size.height / ConstantHandle.imgSpecialiZeIconeCircleDivide - 15
    }
}

//MARK: Extension for configure function
extension DoctorCollectionCell {
    
    //MARK: Cell Configure Functions
    func configure(detail: collectionData) {
        imgSpecializeIcone.image = UIImage(named: detail.imageIcone)
        lblSpecialization.text = detail.specialization
    }
}
