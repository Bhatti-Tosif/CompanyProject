//
//  PickerViewVc.swift
//  CompanyProject
//
//  Created by Tosif Bhatti on 03/04/23.
//

import UIKit

class PickerViewVc: UIViewController {

    //MARK: Outletss
    @IBOutlet private weak var pickerView: UIPickerView!
    @IBOutlet private weak var selectedLabel: UILabel!
    @IBOutlet private weak var textFieldPicker: UITextField!
    
    //MARK: Variable Declaration
    let countries = ["US", "UK", "India", "Australia", "Pakistan"]
    let code = ["+1", "+44", "+91", "+61", "+92"]
    let color = ["Red", "Blue", "Black", "Yellow", "White", "Pink", "Pinch"]
    
    //MARK: LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        func textFieldDidBeginEditing(_ textField: UITextField) {
            self.view.resignFirstResponder()
        }
    }
    
}

//MARK: Extension for initialSetUp
extension PickerViewVc {
    
    func initialSetUp() {
        let secondPicker = UIPickerView()
        textFieldPicker.inputView = secondPicker
        secondPicker.tag = 1
        pickerView.dataSource = self
        pickerView.delegate = self
        secondPicker.dataSource = self
        secondPicker.delegate = self
    }
}

//MARK: Extension for UIPickerViewDataSource
extension PickerViewVc: UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        if pickerView.tag == 1 {
            return 1
        } else {
            return 2
        }
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView.tag == 1 {
            return color.count
        } else {
            return countries.count
        }
    }
    
}

//MARK: Extension for UIPickerViewDelegate
extension PickerViewVc: UIPickerViewDelegate {
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView.tag == 1 {
            return color[row]
        } else {
            if component == 1{
                return countries[row]
            } else {
                return code[row]
            }
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView.tag == 1 {
            textFieldPicker.text = color[row]
            textFieldPicker.resignFirstResponder()
        } else {
            selectedLabel.text = code[row] + " " + countries[row]
        }
    }
    
}

