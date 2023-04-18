//
//  StatusBar.swift
//  CompanyProject
//
//  Created by Tosif Bhatti on 27/03/23.
//

import UIKit

class StatusBar: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    static func changeStatusBarColor(color: UIColor) {
        if #available(iOS 13, *) {
            guard let frame = UIApplication.shared.windows.first?.windowScene?.statusBarManager?.statusBarFrame else {
                return
            }
            let statusBar = UIView(frame: frame)
            statusBar.backgroundColor = color
            UIApplication.shared.windows.first?.addSubview(statusBar)
            
        } else {
            guard let statusBar = UIApplication.shared.value(forKeyPath: "statusBarWindow.statusBar") as? UIView else {
                return
            }
            statusBar.backgroundColor = color
        }
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
