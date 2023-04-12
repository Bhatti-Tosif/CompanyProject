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
    @IBOutlet weak var startImage: UIImageView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblSubTitle: UILabel!
    @IBOutlet weak var getStartpageControll: UIPageControl!
    
    //MARK: Variable Declarations
    var currentIndex = 0
    
    //MARK: ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //MARK: Gesture
        gestureRecognize()
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
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
            currentIndex = currentIndex < 2 ? currentIndex + 1 : 0
            startImage.image = UIImage(named: getStartDetail[currentIndex].startImg)
            getStartpageControll.currentPage = currentIndex
        case .right:
            currentIndex = currentIndex > 0 ? currentIndex - 1 : 2
            startImage.image = UIImage(named: getStartDetail[currentIndex].startImg)
            getStartpageControll.currentPage = currentIndex
        default:
            print("false")
        }
    }
}
