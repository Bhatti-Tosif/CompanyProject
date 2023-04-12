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
    @IBOutlet weak var drImg: UIImageView!
    @IBOutlet weak var drName: UILabel!
    @IBOutlet weak var drSpecialization: UILabel!
    @IBOutlet weak var drAddress: UILabel!
    @IBOutlet weak var rating: UILabel!
    @IBOutlet weak var btnStar: UIButton!
    
    //MARK: AwakeNib
    override func awakeFromNib() {
        super.awakeFromNib()
        drImg.layer.cornerRadius = 15
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
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
        drImg.image = UIImage(named: detail.cellImage)
        drName.text = detail.drName
        drSpecialization.text = detail.specialization
        drAddress.text = detail.address
        rating.text = detail.rating
    }
}
