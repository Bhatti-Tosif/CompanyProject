//
//  AfterReverseKtVC.swift
//  CompanyProject
//
//  Created by Tosif Bhatti on 14/04/23.
//

import UIKit

class AfterReverseKtVC: UIViewController {
    
    //MARK: Outlets
    @IBOutlet private weak var textViewHeight: NSLayoutConstraint!
    @IBOutlet private weak var textViewOutlet: UITextView!
    
    @IBOutlet weak var customeViewOutlet: CustomView!
    //MARK: Variable Declaration
    private let maxHeight: CGFloat = 100
    
    //MARK: LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //MARK: InitialSetUpCall
        initialSetUp()

    }
}

//MARK: Extension for initialSetUp
extension AfterReverseKtVC {
    
    //MARK: Initial SetUp
    func initialSetUp() {
        customeViewOutlet.frame = CGRect(x: 10, y: 10, width: 100, height: 100)
        textViewOutlet.delegate = self
        customeViewOutlet.lblTitle.text = "My CustomeView"
        let cView = CustomView(frame: CGRect(x: 20, y: 20, width: 20, height: 100))
        customeViewOutlet.addSubview(cView)
    }
}

//MARK: Extension for UITextViewDelegate
extension AfterReverseKtVC: UITextViewDelegate {
    func textViewDidChange(_ textView: UITextView) {
        textViewHeight.constant = textViewOutlet.contentSize.height
    }
}

