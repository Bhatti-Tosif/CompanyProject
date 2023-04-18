//
//  StatusBar.swift
//  CompanyProject
//
//  Created by Tosif Bhatti on 27/03/23.
//

import UIKit

class StatusBar: UIViewController {

    //MARK: LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    

    //MARK: changeStatusBArColor
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
}
