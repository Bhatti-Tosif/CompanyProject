//
//  DownloadVc.swift
//  CompanyProject
//
//  Created by Tosif Bhatti on 31/03/23.
//

import UIKit

class DownloadVc: UIViewController {

    //MARK: Outlets
    @IBOutlet private weak var downloadOutlet: UITabBarItem!
    
    //MARK: LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        downloadOutlet.badgeValue = nil
    }

}
