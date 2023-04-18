//
//  InviteWizardTablecell.swift
//  CompanyProject
//
//  Created by Tosif Bhatti on 27/03/23.
//

import UIKit
struct UserDetail {
    var brandName: String
    var userName: String
    var userEmail: String
    var userContact: String
    var chanelname: String
    var signUpDate: String
    var totalRefarals: String
    var totalSubscribers: String
}

class InviteWizardTablecell: UITableViewCell {
    
    //MARK: All Outlet
    
    @IBOutlet weak var brandName: UILabel!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var userId: UILabel!
    @IBOutlet weak var userNumber: UILabel!
    
    @IBOutlet weak var iconeCollectionView: UICollectionView!
    @IBOutlet weak var chanelName: UILabel!
    @IBOutlet weak var signUpDate: UILabel!
    @IBOutlet weak var totalRefarrals: UILabel!
    @IBOutlet weak var totalSubscribers: UILabel!
    @IBOutlet weak var userProfileImg: UIImageView!
    
    let allIcone: [CollectionLogo] = [CollectionLogo(logoIcone: "instagram"), CollectionLogo(logoIcone: "facebook"), CollectionLogo(logoIcone: "linkedin"), CollectionLogo(logoIcone: "twitter"), CollectionLogo(logoIcone: "telegram"), CollectionLogo(logoIcone: "instagram")]
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        iconeCollectionView.dataSource = self
        
        userProfileImg.layer.cornerRadius = userProfileImg.frame.size.width / 2
        
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
            layout.minimumInteritemSpacing = 0
        layout.scrollDirection = .horizontal
        iconeCollectionView.collectionViewLayout = layout
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure(detail: UserDetail) {
        brandName.text = detail.brandName
        userName.text = detail.userName
        userId.text = detail.userEmail
        userNumber.text = detail.userContact
        chanelName.text = detail.chanelname
        signUpDate.text = detail.signUpDate
        totalRefarrals.text = detail.totalRefarals
        totalSubscribers.text = detail.totalSubscribers
    }

}

extension InviteWizardTablecell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        allIcone.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = iconeCollectionView.dequeueReusableCell(withReuseIdentifier: "medialogocell", for: indexPath) as? InviteWizardCollectionCellCollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.configure(icone: allIcone[indexPath.row])
        
        
        return cell
    }
}
