//
//  customeView.swift
//  CompanyProject
//
//  Created by Tosif Bhatti on 14/04/23.
//

import UIKit

@IBDesignable class CustomeView: UIView {

    override init(frame: CGRect) {
        print("frame")
        super.init(frame: frame)
        commitInit()
    }
    
    required init?(coder: NSCoder) {
        print("coder")
        super.init(coder: coder)
        commitInit()
    }
    
    //MARK: Outlets
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var lblTitle: UILabel!
    
    //MARK: Variable Declaration
    @IBInspectable var bgColor: UIColor? {
        get {
            return lblTitle.textColor
        }
        set {
            lblTitle.textColor = newValue
        }
    }

}

//MARK: Extension for Initial SetUp
extension CustomeView {
    
    func commitInit() {
        Bundle.main.loadNibNamed("customeView", owner: self)
        addSubview(containerView)
        containerView.layer.cornerRadius = 20
        containerView.clipsToBounds = true
        containerView.frame = CGRect(x: 50, y: 50, width: 50, height: 50)
        containerView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
    }
    
}
