//
//  ImageViewVc.swift
//  CompanyProject
//
//  Created by Tosif Bhatti on 30/03/23.
//

import UIKit

class ImageViewVc: UIViewController {

    //MARK: Outlets
    @IBOutlet private weak var circleImage: UIImageView!
    
    //MARK: LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //MARK: InitialSetUpCall
        initialSetUp()
    }

}

extension ImageViewVc {
    
    func initialSetUp() {
        circleImage.layer.cornerRadius = circleImage.frame.width / 2
        circleImage.clipsToBounds = true
        //circleImage.layer.masksToBounds = true
    }
}
