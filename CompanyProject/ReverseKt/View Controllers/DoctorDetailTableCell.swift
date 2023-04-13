//
//  doctorDetailTableCell.swift
//  CompanyProject
//
//  Created by Tosif Bhatti on 10/04/23.
//

import UIKit

//MARK: Structure for Detail
struct tableData {
    var cellImage: String
    var drName: String
    var specialization: String
    var address: String
    var rating: String
}
class DoctorDetailTableCell: UITableViewCell {
    
    //MARK: Variable Declaration
    static var tableIdentifier = "doctorTableCell"

    //MARK: Outlets
    @IBOutlet weak var imgDr: UIImageView!
    @IBOutlet weak var lblDrName: UILabel!
    @IBOutlet weak var lblDrSpecialization: UILabel!
    @IBOutlet weak var lblDrAddress: UILabel!
    @IBOutlet weak var lblRating: UILabel!
    @IBOutlet weak var btnStar: UIButton!
    
    //MARK: AwakeNib
    override func awakeFromNib() {
        super.awakeFromNib()
        imgDr.layer.cornerRadius = ConstantHandle.imgDrCornerRadius
    }

    //MARK: Actions
    @IBAction func startapped(_ sender: Any) {
        if isSelected {
            btnStar.setImage(UIImage(systemName: "star"), for: .normal)
            isSelected.toggle()
        } else {
            btnStar.setImage(UIImage(systemName: "star.fill"), for: .normal)
            isSelected.toggle()
        }
    }
    
    //MARK: CellConfigure Functions
    func configure(detail: tableData) {
        imgDr.image = UIImage(named: detail.cellImage)
        lblDrName.text = detail.drName
        lblDrSpecialization.text = detail.specialization
        lblDrAddress.text = detail.address
        lblRating.text = detail.rating
    }
}
