//
//  TabBarVc.swift
//  CompanyProject
//
//  Created by Tosif Bhatti on 31/03/23.
//

import UIKit

class TabBarVc: UIViewController {

    @IBOutlet weak var tabBarOutlet: UITabBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tabBarOutlet.barStyle = .default
        tabBarOutlet.barTintColor = .white
        tabBarOutlet.backgroundColor = .blue
        
        tabBarOutlet.itemPositioning = .fill
        tabBarOutlet.tintColor = .blue
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
