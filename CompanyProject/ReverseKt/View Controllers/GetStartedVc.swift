//
//  GetStartedVc.swift
//  CompanyProject
//
//  Created by Tosif Bhatti on 11/04/23.
//

import UIKit

class GetStartedVc: UIViewController {

    //MARK: Outlets
    @IBOutlet weak var startView: UIView!
    @IBOutlet weak var imgStart: UIImageView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblSubTitle: UILabel!
    @IBOutlet weak var pageControlForStart: UIPageControl!
    @IBOutlet weak var btnStart: UIButton!
    
    //MARK: Variable Declarations
    var currentIndex = 0
    
    //MARK: ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //MARK: InitialSetUp Call
        InitialSetUp()
    }
}

//MARK: extension for InitialSetUp
extension GetStartedVc {
    
    //MARK: InitialSetUp Function
    func InitialSetUp() {
        gestureRecognize()
        btnStart.layer.cornerRadius = ConstantHandle.btnStartCornerRadius
        btnStart.clipsToBounds = true
    }
}

//MARK: Extension for Actions
extension GetStartedVc {
    
    //MARK: All Actions
    @IBAction func getStartPress(_ sender: Any) {
        guard let vc = self.storyboard?.instantiateViewController(withIdentifier: "MainTabBarController") as? MainTabBarController else { return }
        navigationController?.pushViewController(vc, animated: true)
    }
    
}

//MARK: Extension Of Gesture Handles
extension GetStartedVc {
    
    func gestureRecognize() {
        let swipeLeft = UISwipeGestureRecognizer()
        let swipeRight = UISwipeGestureRecognizer()
        swipeLeft.direction = .left
        swipeRight.direction = .right
        startView.addGestureRecognizer(swipeLeft)
        startView.addGestureRecognizer(swipeRight)
        swipeLeft.addTarget(self, action: #selector(swipe))
        swipeRight.addTarget(self, action: #selector(swipe))
    }
    
    @objc func swipe(sender: UISwipeGestureRecognizer) {
        switch sender.direction {
        case .left:
            currentIndex = currentIndex < ConstantHandle.getStartDetailCountIndex ? currentIndex + 1 : .zero
            imgStart.image = UIImage(named: getStartDetail[currentIndex].startImg)
            pageControlForStart.currentPage = currentIndex
        case .right:
            currentIndex = currentIndex > 0 ? currentIndex - 1 : ConstantHandle.getStartDetailCountIndex
            imgStart.image = UIImage(named: getStartDetail[currentIndex].startImg)
            pageControlForStart.currentPage = currentIndex
        default:
            print("false")
        }
    }
}
