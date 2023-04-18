//
//  ActivityIndicaterVc.swift
//  CompanyProject
//
//  Created by Tosif Bhatti on 31/03/23.
//

import UIKit

class ActivityIndicaterVc: UIViewController {

    //MARK: Outlets
    @IBOutlet private weak var activityIndicater: UIActivityIndicatorView!
    
    //MARK: LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //MARK: InitialSetUpCall
        initialSetUp()
    }

}

//MARK: Extension for initialSetUp
extension ActivityIndicaterVc {
    
    func initialSetUp() {
        activityIndicater.style = .large
        activityIndicater.color = .red
        //activityIndicater.startAnimating()
        //activityIndicater.hidesWhenStopped = true
    }
}

//MARK: Extension for Actions
extension ActivityIndicaterVc {
    
    @IBAction func didStartSelect(_ sender: Any) {
        activityIndicater.color = .link
        activityIndicater.startAnimating()
    }
    
    @IBAction func didStopSelect(_ sender: Any) {
        activityIndicater.color = .brown
        activityIndicater.stopAnimating()
    }
    
}
