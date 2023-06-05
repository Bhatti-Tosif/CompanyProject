//
//  HomeVc.swift
//  CompanyProject
//
//  Created by Tosif Bhatti on 31/03/23.
//

import UIKit

class HomeVc: UIViewController {

    //MARK: Variable Declaration
    var downloadNo = 1
    
    //MARK: LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}

//MARK: Extension for Actions
extension HomeVc {
    
    @IBAction func downloadClick(_ sender: Any) {
        let tabBar = self.tabBarController?.tabBar
        let downloadItem = tabBar?.items?[2]
        downloadItem?.badgeColor = .red
        downloadItem?.badgeValue = String(Int(downloadNo))
        downloadNo += 1
    }
    
}
