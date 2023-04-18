//
//  NavPracticeVC.swift
//  CompanyProject
//
//  Created by Tosif Bhatti on 17/04/23.
//

import UIKit

class NavPracticeVC: UIViewController {

    //MARK: LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Initial SetUp
        setNavigationBar()
    }
    
}

//MARK: Extension for setNavigationBar
extension NavPracticeVC {
    
    func setNavigationBar() {
        print("set")
        navigationController?.navigationBar.barTintColor = .cyan
        navigationItem.title = "Home"
        navigationController?.navigationBar.setBackgroundImage(UIImage(systemName: "circle.fill"), for: .default)        
        let editingGroup = UIBarButtonItemGroup.fixedGroup(items: [UIBarButtonItem(title: "redo", style: .plain, target: nil, action: nil),
                                                                   UIBarButtonItem(title: "undo", style: .done, target: nil, action: nil)])
        navigationItem.centerItemGroups = [editingGroup]
    }
    
}
//MARK: Extension for Actions
extension NavPracticeVC {
    
    //MARK: Actions
    @IBAction func gotothirdVc(_ sender: Any) {
        guard let vc = self.storyboard?.instantiateViewController(withIdentifier: "ThirdVC") else { return }
        navigationController?.pushViewController(vc, animated: false)
    }
    
}
