//
//  DataPasingVc.swift
//  CompanyProject
//
//  Created by Tosif Bhatti on 06/04/23.
//

import UIKit

class DataPasingVc: UIViewController {

    //MARK: Outlets
    @IBOutlet private weak var detailLabel: UILabel!
    @IBOutlet private weak var dataImage: UIImageView!
    
    //MARK: Variable Declaration
    var msgImage: String!
    var msgDetail: String!
    
    //MARK: LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()

        dataImage.image = UIImage(named: msgImage)
        detailLabel.text = msgDetail
    }

}
