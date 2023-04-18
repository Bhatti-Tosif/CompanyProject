//
//  extension+UiView.swift
//  CompanyProject
//
//  Created by Tosif Bhatti on 05/04/23.
//

import UIKit

extension UIView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    //return current firstResponder
    var firstResponder: UIView? {
        guard !isFirstResponder else { return self }
        
        for subView in subviews {
            if let firstResponder = subView.firstResponder {
                return firstResponder
            }
        }
        return nil
    }

}
