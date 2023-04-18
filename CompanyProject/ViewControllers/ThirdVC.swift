//
//  ThirdVC.swift
//  CompanyProject
//
//  Created by Tosif Bhatti on 17/04/23.
//

import UIKit

class ThirdVC: UIViewController {

    //MARK: LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()

        //InitialSetUp
        setNav()
    }
    
}
//MARK: Extension for Actions
extension ThirdVC {
    
    @IBAction func tapThirdVC(_ sender: Any) {
        navigationController?.popViewController(animated: false)
    }
    
}

//MARK: Extension for SetNAvigationBar
extension ThirdVC {
    
    func setNav() {
        navigationController?.navigationBar.backgroundColor = .cyan
        navigationItem.title = "ThirdVC"
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "Custome", style: .plain, target: nil, action: nil)
        navigationItem.backBarButtonItem?.tintColor = .black
        navigationItem.leftBarButtonItems = [UIBarButtonItem(title: "C", style: .plain, target: nil, action: nil), UIBarButtonItem(title: "D", style: .done, target: nil, action: nil)]
        let editingGroup = UIBarButtonItemGroup.fixedGroup(items: [UIBarButtonItem(title: "redo", style: .plain, target: nil, action: nil),
                                                                   UIBarButtonItem(title: "undo", style: .done, target: nil, action: nil)])
        let croping = UIBarButtonItem(title: "crop", style: .plain, target: nil, action: nil)
        let croppingGroup = croping.creatingMovableGroup(customizationIdentifier: "Cropping")
        navigationItem.centerItemGroups = [editingGroup, croppingGroup]
        
        //navigationItem.leadingItemGroups = [editingGroup]
        navigationItem.trailingItemGroups = [editingGroup]
        //navigationItem.pinnedTrailingGroup = editingGroup
    }
    
}
