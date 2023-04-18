//
//  SegmentVc.swift
//  CompanyProject
//
//  Created by Tosif Bhatti on 30/03/23.
//

import UIKit

class SegmentVc: UIViewController {
    
    //MARK: Outlets
    @IBOutlet private weak var segmentControl: UISegmentedControl!
    @IBOutlet private weak var imageView: UIImageView!
    @IBOutlet private weak var pageControl: UIPageControl!
    
    //MARK: Variable Declaration
    var currentPage = 0
    
    //MARK: LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //MARK: InitialSetUpCall
        initialSetUp()
    }

}

//MARK: Extension for initialSetUp
extension SegmentVc {
    
    func initialSetUp() {
        segmentControl.setTitle("Insta", forSegmentAt: 0)
        segmentControl.setTitle("Twitter", forSegmentAt: 1)
        segmentControl.setTitle("Linkedin", forSegmentAt: 2)
        segmentControl.setTitle("FaceBook", forSegmentAt: 3)
        updatePageControll()
    }
}

//MARK: Extension for Actions
extension SegmentVc {
    
    @IBAction func didSegmentChange(_ sender: UISegmentedControl) {
        let index = sender.selectedSegmentIndex
        switch (index) {
        case 0:
            imageView.image = UIImage(named: "instagram")
            pageControl.currentPage = 0
        case 1:
            imageView.image = UIImage(named: "twitter")
            pageControl.currentPage = 1
        case 2:
            imageView.image = UIImage(named: "linkedin")
            pageControl.currentPage = 2
        case 3:
            imageView.image = UIImage(named: "facebook")
            pageControl.currentPage = 3
        default:
            print("wrong index")
        }
    }
    
    @IBAction func didPageControlChange(_ sender: UIPageControl) {
        //let sender.selecte
        switch pageControl.currentPage {
        case 0:
            imageView.image = UIImage(named: "instagram")
            segmentControl.selectedSegmentIndex = 0
        case 1:
            imageView.image = UIImage(named: "twitter")
            segmentControl.selectedSegmentIndex = 1
        case 2:
            imageView.image = UIImage(named: "linkedin")
            segmentControl.selectedSegmentIndex = 2
        case 3:
            imageView.image = UIImage(named: "facebook")
            segmentControl.selectedSegmentIndex = 3
        default:
            print("wrong index")
        }
    }
    
    @IBAction func didLeftPress(_ sender: Any) {
        switch pageControl.currentPage {
        case 0:
            imageView.image = UIImage(named: "instagram")
            segmentControl.selectedSegmentIndex = 0
        case 1:
            imageView.image = UIImage(named: "twitter")
            segmentControl.selectedSegmentIndex = 1
        case 2:
            imageView.image = UIImage(named: "linkedin")
            segmentControl.selectedSegmentIndex = 2
        case 3:
            imageView.image = UIImage(named: "facebook")
            segmentControl.selectedSegmentIndex = 3
        default:
            print("wrong index")
        }
        if currentPage > 0 {
            currentPage -= 1
            updatePageControll()
        }
    }
    
    @IBAction func didRightPress(_ sender: Any) {
        switch pageControl.currentPage {
        case 0:
            imageView.image = UIImage(named: "instagram")
            segmentControl.selectedSegmentIndex = 0
        case 1:
            imageView.image = UIImage(named: "twitter")
            segmentControl.selectedSegmentIndex = 1
        case 2:
            imageView.image = UIImage(named: "linkedin")
            segmentControl.selectedSegmentIndex = 2
        case 3:
            imageView.image = UIImage(named: "facebook")
            segmentControl.selectedSegmentIndex = 3
        default:
            print("wrong index")
        }
        if currentPage < pageControl.numberOfPages {
            currentPage += 1
            updatePageControll()
        }
    }
    func updatePageControll() {
        pageControl.currentPage = currentPage
    }
}

