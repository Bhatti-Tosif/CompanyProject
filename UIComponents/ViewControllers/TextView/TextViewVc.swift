//
//  TextView.swift
//  CompanyProject
//
//  Created by Tosif Bhatti on 29/03/23.
//

import UIKit

class TextViewVc: UIViewController {

    //MARK: Outlets
    @IBOutlet private weak var firstTextView: UITextView!
    
    //MARK: LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        firstTextView.delegate = self
    }

}
 
//MARK: Extension for UITextViewDelegate
extension TextViewVc: UITextViewDelegate {
    func textViewDidChange(_ textView: UITextView) {
        print("did Change")
    }
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        print("Should change")
        return true
    }
}
