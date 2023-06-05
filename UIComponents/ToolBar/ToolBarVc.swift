//
//  ToolBarVc.swift
//  CompanyProject
//
//  Created by Tosif Bhatti on 31/03/23.
//

import UIKit

class ToolBarVc: UIViewController {

    //MARK: Outlets
    @IBOutlet private weak var toolBarOutlet: UIToolbar!
    @IBOutlet private weak var labelOutlet: UILabel!
    
    //MARK: LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}

//MARK: Extension for Actions
extension ToolBarVc {
    
    @IBAction func openBtn(_ sender: Any) {
        showSimpleAlert()
    }
    
    @IBAction func closePress(_ sender: Any) {
        showSimpleActionSheet()
    }
    
}

//MARK: Extension for functions
extension ToolBarVc {
    
    func showSimpleAlert() {
        let alert = UIAlertController(title: "Sign Out", message: "You Want to Add title", preferredStyle: UIAlertController.Style.alert)
        
        alert.addAction(UIAlertAction(title: "Add", style: UIAlertAction.Style.default, handler:  { [weak self] _ in
            self?.labelOutlet.text = "You Changed Label"
        }))
        alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertAction.Style.destructive, handler: { _ in
            self.labelOutlet.text = "Cancel"
        }))
        alert.addAction(UIAlertAction(title: "Dismiss", style: UIAlertAction.Style.cancel, handler: {_ in
            self.labelOutlet.text = "Dismiss"
        }))
        present(alert, animated: true)
    }
    
    func showSimpleActionSheet() {
        let alert = UIAlertController(title: "Sign Out?", message: "This is Action Sheet", preferredStyle: UIAlertController.Style.actionSheet)
        
        alert.addAction(UIAlertAction(title: "Approve", style: UIAlertAction.Style.default, handler: { _ in
            self.labelOutlet.text = "Approved"
        }))
        
        alert.addAction(UIAlertAction(title: "Edit", style: UIAlertAction.Style.default, handler: { _ in
            self.labelOutlet.text = "Edit"
        }))
        alert.addAction(UIAlertAction(title: "Delete", style: UIAlertAction.Style.destructive, handler: { _ in
            self.labelOutlet.text = "Delete"
        }))
        alert.addAction(UIAlertAction(title: "Dismiss", style: UIAlertAction.Style.cancel, handler:  { _ in
            self.labelOutlet.text = "Dismiss"
        }))
        present(alert, animated: true)
    }
    
}
