//
//  ParkingLocationDataTableViewCell.swift
//  CompanyProject
//
//  Created by Tosif Bhatti on 24/03/23.
//

import UIKit

struct ParkingData {
    let parkingCode: String
    let parkingName: String
    let parkingAddress: String
    let carImage: String
}

class ParkingLocationDataTableViewCell: UITableViewCell {
    
    //MARK: Outlets
    @IBOutlet weak var carImage: UIImageView!
    @IBOutlet weak var parkingCode: UILabel!
    @IBOutlet weak var parkingName: UILabel!
    @IBOutlet weak var parkingAddress: UILabel!
    @IBOutlet weak var selectedArrow: UIImageView!
    @IBOutlet weak var OutercellView: UIView!
    
  
    
    //MARK: Give space between two cell
//    override func layoutSubviews() {
//        super.layoutSubviews()
//
//        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 8, left: 0, bottom: 8, right: 0))
//    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        if selected {
            OutercellView.backgroundColor = UIColor(named: "iceBlue - Two")
            selectedArrow.isHidden = false
        } else {
            OutercellView.backgroundColor = UIColor(named: "white - Three")
            selectedArrow.isHidden = true
        }
        
        OutercellView.layer.borderWidth = selected ? 1 : 0
        OutercellView.layer.borderColor = selected ? UIColor(named: "deepAqua")?.cgColor : UIColor(named: "white")?.cgColor

        // Configure the view for the selected state
        
    }
    func configure(data: ParkingData) {
        carImage.image = UIImage(named: data.carImage)
        parkingCode.text = data.parkingCode
        parkingName.text = data.parkingName
        parkingAddress.text = data.parkingAddress
        selectedArrow.image = UIImage(named: "iconMenuCopy")
    }

}

