//
//  MainTabBarController.swift
//  CompanyProject
//
//  Created by Tosif Bhatti on 11/04/23.
//

import UIKit

class MainTabBarController: UITabBarController {

    //MARK: ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()

        //MARK: InitialSetUp Call
        initialSetUp()
    }
}

//MARK: Extension for Initial SetUp
extension MainTabBarController {
    
    //MARK: Intial Setup
    func initialSetUp() {
        self.selectedIndex = ConstantHandle.tabBarControllerSelectedIndex
    }
}
