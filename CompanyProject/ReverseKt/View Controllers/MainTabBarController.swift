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

        //MARK: Open Particular tab directly
        self.selectedIndex = ConstantHandle.tabBarControllerSelectedIndex
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
}
