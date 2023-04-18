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
    @IBOutlet private weak var brandName: UILabel!
    @IBOutlet private weak var userName: UILabel!
    @IBOutlet private weak var userId: UILabel!
    @IBOutlet private weak var userNumber: UILabel!
    @IBOutlet private weak var iconeCollectionView: UICollectionView!
    @IBOutlet private weak var chanelName: UILabel!
    @IBOutlet private weak var signUpDate: UILabel!
    @IBOutlet private weak var totalRefarrals: UILabel!
    @IBOutlet private weak var totalSubscribers: UILabel!
    @IBOutlet private weak var userProfileImg: UIImageView!
    
    //MARK: Variable Declaration
    let allIcone: [CollectionLogo] = [CollectionLogo(logoIcone: "instagram"), CollectionLogo(logoIcone: "facebook"), CollectionLogo(logoIcone: "linkedin"), CollectionLogo(logoIcone: "twitter"), CollectionLogo(logoIcone: "telegram"), CollectionLogo(logoIcone: "instagram")]
    
    //MARK: LifeCycle
    override func awakeFromNib() {
        super.awakeFromNib()
        
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
    }
    
    //MARK: Configure Cell
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

//MARK: Extension for UICollectionViewDataSource
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
