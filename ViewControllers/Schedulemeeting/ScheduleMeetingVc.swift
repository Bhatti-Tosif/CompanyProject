//
//  ScheduleMeetingVc.swift
//  CompanyProject
//
//  Created by Tosif Bhatti on 04/04/23.
//

import UIKit

class ScheduleMeetingVc: UIViewController {

    //MARK: Outlets
    @IBOutlet private weak var titleMeeting: UITextField!
    @IBOutlet private weak var descriptionOutlet: UITextView!
    @IBOutlet private weak var startdateOutlet: UITextField!
    @IBOutlet private weak var startTimeOutlet: UITextField!
    @IBOutlet private weak var timeZoneOutlet: UITextField!
    @IBOutlet private weak var durationOutlet: UITextField!
    @IBOutlet private weak var conferenceOutlet: UILabel!
    @IBOutlet private weak var webinarOutlet: UILabel!
    @IBOutlet private weak var switchOutlet: UISwitch!
    @IBOutlet private weak var passwordOutlet: UITextField!
    @IBOutlet private weak var emailAddressoutlet: UITextField!
    @IBOutlet private weak var toolBarForKeyBoard: UIToolbar!
    @IBOutlet private weak var conferenceImage: UIButton!
    @IBOutlet private weak var webinarImage: UIButton!
    @IBOutlet private weak var meetingPasswordLabel: UILabel!
    
    //MARK: Variable Declaration
    let timeZone = ["AF-UTC +04:30", "IN-UTC +05:30", "ID-UTC +07:00"]
    let datePicker = UIDatePicker()
    let timePicker = UIDatePicker()
    let durationPicker = UIDatePicker()
    let pickerView = UIPickerView()
    
    //MARK: LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //MARK: InitialSetUpCall
        initialSetUp()
        
    }
}

//MARK: Self Extension Methods
extension ScheduleMeetingVc {
    
    func initialSetUp() {
        setNavigationTitle(title: "Schedule meeting", textColor: UIColor.black)
        setArrowBack()
        
        //MARK: TextView Style
        descriptionOutlet.layer.borderWidth = 1
        descriptionOutlet.layer.borderColor = UIColor.gray.cgColor
        descriptionOutlet.layer.cornerRadius = 10
        setRightImageInTextfield(outlet: startdateOutlet, image: UIImage(systemName: "calendar") ?? UIImage())
        setRightImageInTextfield(outlet: startTimeOutlet, image: UIImage(systemName: "timer") ?? UIImage())
        setRightImageInTextfield(outlet: timeZoneOutlet, image: UIImage(systemName: "chevron.down.square") ?? UIImage())
        setRightImageInTextfield(outlet: durationOutlet, image: UIImage(systemName: "chevron.down.square") ?? UIImage())
        titleMeeting.delegate = self
        descriptionOutlet.delegate = self
        startdateOutlet.delegate = self
        startTimeOutlet.delegate = self
        durationOutlet.delegate = self
        timeZoneOutlet.delegate = self
        passwordOutlet.delegate = self
        emailAddressoutlet.delegate = self
        textViewPlaceHolder()

        //MARK: Tag for all TextField
        titleMeeting.tag = 1
        descriptionOutlet.tag = 2
        startdateOutlet.tag = 3
        startTimeOutlet.tag = 4
        timeZoneOutlet.tag = 5
        durationOutlet.tag = 6
        passwordOutlet.tag = 7
        emailAddressoutlet.tag = 8
        
    }
    
    func setRightImageInTextfield(outlet: UITextField, image: UIImage) {
        let imageView = UIImageView(frame: CGRect(x: 10, y: 10, width: 20, height: 20))
        imageView.image = image
        let imageContainerView: UIView = UIView(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
        imageContainerView.addSubview(imageView)
        outlet.rightView = imageContainerView
        outlet.rightViewMode = .always
        outlet.tintColor = .gray
    }
    
    func openDatePicker(textField: UITextField) {
        textField.inputAccessoryView = toolBarForKeyBoard
        switch textField.tag {
        case 3:
            textField.inputView = datePicker
            datePicker.datePickerMode = .date
            datePicker.preferredDatePickerStyle = .inline
        case 4:
            textField.inputView = timePicker
            timePicker.datePickerMode = .time
            timePicker.preferredDatePickerStyle = .wheels
        case 5:
            openPickerView(textField: timeZoneOutlet)
           
        case 6:
            textField.inputView = durationPicker
            durationPicker.datePickerMode = .countDownTimer
            durationPicker.preferredDatePickerStyle = .wheels
        default:
            print("wrong Outlet")
        }
        
    }
    
    func openPickerView(textField: UITextField) {
        textField.inputView = pickerView
        pickerView.delegate = self
        pickerView.dataSource = self
    }
    
    func showAlert() {
        let alert = UIAlertController(title: "Meeting type", message: "Select Appropriate Meeting Type", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Add", style: .default, handler: {_ in
            self.webinarImage.tintColor = .systemCyan
        }))
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: {_ in
            self.webinarImage.tintColor = .gray
        }))
        
        present(alert, animated: true)
    }
    
    func textViewPlaceHolder() {
        descriptionOutlet.delegate = self
        let placeHolder = "Enter Description Here...."
        descriptionOutlet.text = placeHolder
        descriptionOutlet.textColor = .lightGray
    }
}

//MARK: Extension for Actions
extension ScheduleMeetingVc {
    
    //MARK: Actions
    @IBAction func switchTapped(_ sender: Any) {
        if switchOutlet.isOn {
            passwordOutlet.isEnabled = true
            meetingPasswordLabel.isEnabled = true
            
        } else {
            passwordOutlet.isEnabled = false
            meetingPasswordLabel.isEnabled = false
        }
    }
    
    @IBAction func doneTapped(_ sender: Any) {
        guard let firstResponder = view.firstResponder else { return }
        let dateFormatter = DateFormatter()
        
        switch (firstResponder.tag) {
        case 1:
            titleMeeting.resignFirstResponder()
            descriptionOutlet.becomeFirstResponder()
        case 2:
            descriptionOutlet.resignFirstResponder()
            startdateOutlet.becomeFirstResponder()
        case 3:
            dateFormatter.dateStyle = .medium
            startdateOutlet.text = dateFormatter.string(from: datePicker.date)
            startdateOutlet.resignFirstResponder()
            startTimeOutlet.becomeFirstResponder()
        case 4:
            dateFormatter.timeStyle = .medium
            startTimeOutlet.text = dateFormatter.string(from: timePicker.date)
            startTimeOutlet.resignFirstResponder()
            timeZoneOutlet.becomeFirstResponder()
        case 5:
            timeZoneOutlet.resignFirstResponder()
            durationOutlet.becomeFirstResponder()
        case 6:
            var second = Int(durationPicker.countDownDuration)
            let hr = second / 3600
            second %= 3600
            let min = second / 60
            let time = hr != 0 ? "\(hr) hr : \(min) min" : "00 hr : \(min) min"
            durationOutlet.text = time
            durationOutlet.resignFirstResponder()
            if passwordOutlet.isEnabled {
                passwordOutlet.becomeFirstResponder()
            } else {
                emailAddressoutlet.becomeFirstResponder()
            }
        case 7:
            passwordOutlet.resignFirstResponder()
            emailAddressoutlet.becomeFirstResponder()
        case 8:
            emailAddressoutlet.resignFirstResponder()
        default:
            print("Wrong tag")
        }
    }
    
    @IBAction func cancelTapped(_ sender: Any) {
        guard let firstResponder = view.firstResponder else { return }
        switch (firstResponder.tag) {
        case 1:
            titleMeeting.text = firstResponder.textInputContextIdentifier
            titleMeeting.resignFirstResponder()
        case 2:
            descriptionOutlet.resignFirstResponder()
        case 3:
            startdateOutlet.resignFirstResponder()
        case 4:
            startTimeOutlet.resignFirstResponder()
        case 5:
            timeZoneOutlet.resignFirstResponder()
        case 6:
            durationOutlet.resignFirstResponder()
        case 7:
            passwordOutlet.resignFirstResponder()
        case 8:
            emailAddressoutlet.resignFirstResponder()
        default:
            print("Wrong tag")
        }
    }
    
    
    @IBAction func conferenceTapped(_ sender: Any) {
        conferenceImage.tintColor = .systemCyan
        conferenceImage.setImage(UIImage(systemName: "circle.inset.filled"), for: .normal)
        webinarImage.setImage(UIImage(systemName: "circle"), for: .normal)
        conferenceOutlet.textColor = .black
        webinarOutlet.textColor = .gray
        webinarImage.tintColor = .gray
    }
    @IBAction func webinarTapped(_ sender: Any) {
        webinarImage.tintColor = .systemCyan
        webinarImage.setImage(UIImage(systemName: "circle.inset.filled"), for: .normal)
        webinarOutlet.textColor = .black
        conferenceOutlet.textColor = .gray
        conferenceImage.tintColor = .gray
        conferenceImage.setImage(UIImage(systemName: "circle"), for: .normal)
    }
    
    @IBAction func infoTapped(_ sender: Any) {
        showAlert()
    }
}

//MARK: TextField Delegate
extension ScheduleMeetingVc: UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        self.openDatePicker(textField: textField)
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField.tag {
        case 1:
            descriptionOutlet.becomeFirstResponder()
        case 2:
            descriptionOutlet.resignFirstResponder()
            startdateOutlet.becomeFirstResponder()
        default:
            print("wrong tag")
        }
        return true
    }
}

//MARK: PickerView DataSource
extension ScheduleMeetingVc: UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return timeZone.count
    }
    
    
}

//MARK: PickerView Delegate
extension ScheduleMeetingVc: UIPickerViewDelegate {
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return timeZone[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        timeZoneOutlet.text = timeZone[row]
    }
}

//MARK: TextViewDelegate
extension ScheduleMeetingVc: UITextViewDelegate {
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.textColor == .lightGray {
            textView.text = ""
            textView.textColor = .black
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty {
            textView.text = "Enter Description..."
            textView.textColor = .lightGray
        }
    }
}
