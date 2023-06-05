//
//  SliderVc.swift
//  CompanyProject
//
//  Created by Tosif Bhatti on 30/03/23.
//

import UIKit

class SliderVc: UIViewController {

    //MARK: All Outlet
    @IBOutlet private weak var slider: UISlider!
    @IBOutlet private weak var textLabel: UILabel!
    @IBOutlet private weak var imagethumb: UISlider!
    
    //MARK: LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()

        //MARK: InitialSetUpCall
        initialSetUp()
    }
}

//MARK: Extension for initialSetUp
extension SliderVc {
    
    func initialSetUp() {
        slider.value = 0.5
        imagethumb.setThumbImage(R.image.iconMenuCopy(), for: .normal)
    }
}

//MARK: Extension for Actions
extension SliderVc {
    
    @IBAction func changeVAlueSlider(_ sender: Any) {
        textLabel.text = String(slider.value * 100)
    }
}
