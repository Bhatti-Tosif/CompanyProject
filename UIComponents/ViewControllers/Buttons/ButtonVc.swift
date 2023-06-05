//
//  ButtonVc.swift
//  CompanyProject
//
//  Created by Tosif Bhatti on 29/03/23.
//

import UIKit

class ButtonVc: UIViewController {

    //MARK: Outlets
    @IBOutlet private weak var btn_Action: UIButton!
    @IBOutlet private weak var pullDownButton: UIButton!
    @IBOutlet private weak var popupButton: UIButton!
    
    //MARK: LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpFunction()
    }

}

//MARK: Extension for setUpFunction
extension ButtonVc {
    
    func setUpFunction() {
        let optionClosure = { (action: UIAction) in
            print(action.title)
        }
        popupButton.menu = UIMenu(children: [
            UIAction(title: "Option 1", state: .on, handler: optionClosure),
            UIAction(title: "Option 2", handler: optionClosure),
            UIAction(title: "Option 3", handler: optionClosure)])
        popupButton.showsMenuAsPrimaryAction = true
        popupButton.changesSelectionAsPrimaryAction = true
    }
    
}

//MARK: Extension for Actions
extension ButtonVc {
    
    @IBAction func VALUECHANGED(_ sender: Any) {
        btn_Action.tintColor = R.color.deepAqua()
    }
    @IBAction func cancelTouch(_ sender: Any) {
        btn_Action.setTitle("CANCEL", for: .highlighted)
    }
    @IBAction func editingChanged(_ sender: Any) {
        btn_Action.backgroundColor = .white
    }
    @IBAction func insideTouch(_ sender: Any) {
        btn_Action.setTitle("Inside", for: .normal)
    }
    @IBAction func touchOutSide(_ sender: Any) {
        btn_Action.setTitle("Outside", for: .normal)
    }
}
