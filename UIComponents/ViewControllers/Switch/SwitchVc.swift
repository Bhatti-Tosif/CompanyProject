//
//  SwitchVc.swift
//  CompanyProject
//
//  Created by Tosif Bhatti on 30/03/23.
//

import UIKit

class SwitchVc: UIViewController {

    //MARK: Outlets
    @IBOutlet private weak var customeSwitch: UISwitch!
    @IBOutlet private weak var switchCheck: UISwitch!
    @IBOutlet private weak var nameEnter: UITextField!
    
    //MARK: LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //MARK: InitialSetUpCall
        initialSetUp()
    }

}

//MARK: Extension for initialSetUp
extension SwitchVc {
    
    func initialSetUp() {
        switchCheck.onImage = UIImage(named: "iconMenuCopy")
        switchCheck.offImage = UIImage(named: "iconeMenuCopy")
        if customeSwitch.isOn {
            customeSwitch.backgroundColor = .white
        } else {
            customeSwitch.subviews[0].subviews[0].backgroundColor = UIColor(named: "deepAqua")
        }
    }
}

//MARK: Extension for Actions
extension SwitchVc {
    
    @IBAction func checkValueChanged(_ sender: Any) {
        if switchCheck.isOn {
            nameEnter.isEnabled = true
        } else {
            nameEnter.isEnabled = false
        }
    }
}
