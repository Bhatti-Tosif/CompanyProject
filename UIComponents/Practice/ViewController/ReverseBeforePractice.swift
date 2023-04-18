//
//  ReverseBeforePractice.swift
//  CompanyProject
//
//  Created by Tosif Bhatti on 13/04/23.
//

import UIKit

class ReverseBeforePractice: UIViewController {

    //MARK: Outlets
    @IBOutlet private weak var img1: UIImageView!
    @IBOutlet private weak var img2: UIImageView!
    @IBOutlet private weak var img3: UIImageView!
    @IBOutlet private weak var txtField1: UITextField!
    @IBOutlet private weak var textField2: UITextField!
    @IBOutlet private weak var txtField3: UITextField!
    
    //MARK: LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //MARK: InitialSetUpCall
       initialSetUp()
    }
    
}

//MARK: Extension for initialSetUp
extension ReverseBeforePractice {
    
    //MARK: InitialSetUp
    func initialSetUp() {
        txtField1.delegate = self
        textField2.delegate = self
        txtField3.delegate = self
    }
}

//MARK: Extension for Actions
extension ReverseBeforePractice {
    
    @IBAction func imageWithTitle(_ sender: Any) {
        img2.layer.cornerRadius = img2.frame.height / 2
        img2.clipsToBounds = true
    }
    
}

//MARK: Extension for UITextFieldDelegate
extension ReverseBeforePractice: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
        case txtField1:
            print("1")
            resignFirstResponder()
            textField2.becomeFirstResponder()
        case textField2:
            print("2")
            resignFirstResponder()
            txtField3.becomeFirstResponder()
        case txtField3:
            print("3")
            txtField3.resignFirstResponder()
        default:
            print("wrong")
        }
        return true
    }
    
}
