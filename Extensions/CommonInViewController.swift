//
//  ViewController.swift
//  CompanyProject
//
//  Created by Tosif Bhatti on 04/04/23.
//

import UIKit

extension UIViewController {
    
    //MARK: SetNavigation Title
    func setNavigationTitle(title: String, textColor: UIColor) {
        let uiLabel = UILabel()
        uiLabel.text = title
        uiLabel.textColor = textColor
        navigationItem.titleView = uiLabel
    }
    
    //MARK: SetBackArrow in NavigationBar
    func setArrowBack() {
        navigationItem.setLeftBarButton(UIBarButtonItem(image: R.image.iconArrowBack(), style: .plain , target: self, action: #selector(backButton)), animated: true)
    }
    
    @objc func backButton() {
        navigationController?.popViewController(animated: true)
    }
}
