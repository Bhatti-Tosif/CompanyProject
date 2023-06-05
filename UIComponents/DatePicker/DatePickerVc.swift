//
//  DatePickerVc.swift
//  CompanyProject
//
//  Created by Tosif Bhatti on 03/04/23.
//

import UIKit

class DatePickerVc: UIViewController {

    //MARK: Outlets
    @IBOutlet private weak var segmentView: UISegmentedControl!
    @IBOutlet private weak var datePicker: UIDatePicker!
    @IBOutlet private weak var dateShowLabel: UILabel!
    @IBOutlet private weak var textFieldOutlet: UITextField!
    
    //MARK: LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //MARK: InitialSetUpCall
        initialSetUp()
    }
    
}
//MARK: Extension for initialSetUp
extension DatePickerVc {
    
    func initialSetUp() {
        datePicker.locale = .current
        datePicker.date = Date()
        datePicker.datePickerMode = .date
        datePicker.preferredDatePickerStyle = .wheels
        datePicker.addTarget(self, action: #selector(dateSelected), for: .valueChanged)
        datePicker.minimumDate = .now
        datePicker.maximumDate = .distantFuture
        
        textFieldOutlet.delegate = self
    }
}
//MARK: Extension for Actions
extension DatePickerVc {
    
    @objc func dateSelected() {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .short
        let date = dateFormatter.string(from: datePicker.date)
        dateShowLabel.text = date
    }

    @IBAction func segmentTapped(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            datePicker.preferredDatePickerStyle = .wheels
        case 1:
            datePicker.preferredDatePickerStyle = .compact
        case 2:
            datePicker.preferredDatePickerStyle = .inline
        default:
            break
        }
    }
}

//MARK: Extension for functions
extension DatePickerVc {
    
    func openDatePicker() {
        let datePicker = UIDatePicker()
        datePicker.datePickerMode = .date
        datePicker.preferredDatePickerStyle = .wheels
        textFieldOutlet.inputView = datePicker
        
        let toolBar = UIToolbar(frame: CGRect(x: 0, y: 0, width: self.view.frame.width , height: 44))
        let cancelButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(cancelTapped))
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(doneTapped))
        let flexible = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        toolBar.setItems([cancelButton, flexible, doneButton], animated: false)
        textFieldOutlet.inputAccessoryView = toolBar
    }
    
    @objc func cancelTapped() {
        textFieldOutlet.resignFirstResponder()
    }
    
    @objc func doneTapped() {
        if let datePicker = textFieldOutlet.inputView as? UIDatePicker {
            let dateFormatter = DateFormatter()
            dateFormatter.dateStyle = .medium
            textFieldOutlet.text = dateFormatter.string(from: datePicker.date)
        }
        textFieldOutlet.resignFirstResponder()
    }
}

//MARK: Extension for UITextFieldDelegate
extension DatePickerVc: UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        self.openDatePicker()
    }
}
