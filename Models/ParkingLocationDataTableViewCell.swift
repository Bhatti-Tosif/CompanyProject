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
    @IBOutlet private weak var carImage: UIImageView!
    @IBOutlet private weak var parkingCode: UILabel!
    @IBOutlet private weak var parkingName: UILabel!
    @IBOutlet private weak var parkingAddress: UILabel!
    @IBOutlet private weak var selectedArrow: UIImageView!
    @IBOutlet private weak var OutercellView: UIView!
    
  
    
    //MARK: Give space between two cell
//    override func layoutSubviews() {
//        super.layoutSubviews()
//
//        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 8, left: 0, bottom: 8, right: 0))
//    }
    
    //MARK: LifeCycle
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        if selected {
            OutercellView.backgroundColor = R.color.iceBlueTwo()
            selectedArrow.isHidden = false
        } else {
            OutercellView.backgroundColor = R.color.whiteThree()
            selectedArrow.isHidden = true
        }
        
        OutercellView.layer.borderWidth = selected ? 1 : 0
        OutercellView.layer.borderColor = selected ? R.color.deepAqua()?.cgColor : R.color.whiteThree()?.cgColor
        
    }
    
    //MARK: Configure Cell
    func configure(data: ParkingData) {
        carImage.image = UIImage(named: data.carImage)
        parkingCode.text = data.parkingCode
        parkingName.text = data.parkingName
        parkingAddress.text = data.parkingAddress
        selectedArrow.image = R.image.iconMenuCopy()
    }

}

