//
//  doctorDetailTableCell.swift
//  CompanyProject
//
//  Created by Tosif Bhatti on 10/04/23.
//

import UIKit

struct tableData {
    var cellImage: String
    var drName: String
    var specialization: String
    var address: String
    var rating: String
}
class DoctorDetailTableCell: UITableViewCell {
    
    static var tableIdentifier = "doctorTableCell"

    //MARK: Outlets
    @IBOutlet weak var drImg: UIImageView!
    @IBOutlet weak var drName: UILabel!
    @IBOutlet weak var drSpecialization: UILabel!
    @IBOutlet weak var drAddress: UILabel!
    @IBOutlet weak var rating: UILabel!
    @IBOutlet weak var btnStar: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    

    @IBAction func startapped(_ sender: Any) {
        if isSelected {
            btnStar.setImage(UIImage(systemName: "star"), for: .normal)
            isSelected.toggle()
        } else {
            btnStar.setImage(UIImage(systemName: "star.fill"), for: .normal)
            isSelected.toggle()
        }
    }
    
    
    func configure(detail: tableData) {
        drImg.image = UIImage(named: detail.cellImage)
        drName.text = detail.drName
        drSpecialization.text = detail.specialization
        drAddress.text = detail.address
        rating.text = detail.rating
    }
}
