//
//  TextFieldVc.swift
//  CompanyProject
//
//  Created by Tosif Bhatti on 29/03/23.
//

import UIKit

class TextFieldVc: UIViewController {

    //MARK: Outlets
    @IBOutlet private weak var textFieldOutlet: UITextField!
    
    //MARK: LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()

        textFieldOutlet.delegate = self
    }
    
}

//MARK: Extension for UITextFieldDelegate
extension TextFieldVc : UITextFieldDelegate {
    
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        print("clear")
        return true
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print("should return")
        return true
    }
    func textFieldDidEndEditing(_ textField: UITextField, reason: UITextField.DidEndEditingReason) {
        print("end editing")
        print("Reason: \(reason)")
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        print("Did begin editing")
    }
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        print("should end")
        return true
    }
    func textFieldDidChangeSelection(_ textField: UITextField) {
        print("did change selection")
    }
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        print("sholud change character")
        return true
    }
    
}
