//
//  FirstScreen.swift
//  CompanyProject
//
//  Created by Tosif Bhatti on 20/03/23.
//

import UIKit

class FirstScreen: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func InviteWizardClick(_ sender: Any) {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Invite Wizards", bundle: nil)
        let vc = storyBoard.instantiateViewController(withIdentifier: "InviteWizardViewController") as! InviteWizardViewController
        self.navigationController?.pushViewController(vc, animated: true)
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
