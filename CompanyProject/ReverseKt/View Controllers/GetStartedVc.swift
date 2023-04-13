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
        
        //MARK: Gesture
        gestureRecognize()
        btnStart.layer.cornerRadius = ConstantHandle.btnStartCornerRadius
        btnStart.clipsToBounds = true
        
    }
    
    //MARK: All Actions
    @IBAction func getStartPress(_ sender: Any) {
        guard let vc = self.storyboard?.instantiateViewController(withIdentifier: "MainTabBarController") as? MainTabBarController else { return }
        navigationController?.pushViewController(vc, animated: true)
    }
}

//MARK: Extension Of Itself
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
            currentIndex = currentIndex < scrollingImages.count - 1 ? currentIndex + 1 : 0
            imgStart.image = UIImage(named: getStartDetail[currentIndex].startImg)
            pageControlForStart.currentPage = currentIndex
        case .right:
            currentIndex = currentIndex > 0 ? currentIndex - 1 : 2
            imgStart.image = UIImage(named: getStartDetail[currentIndex].startImg)
            pageControlForStart.currentPage = currentIndex
        default:
            print("false")
        }
    }
}
