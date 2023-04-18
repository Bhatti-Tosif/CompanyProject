//
//  StapperVc.swift
//  CompanyProject
//
//  Created by Tosif Bhatti on 30/03/23.
//

import UIKit

class StapperVc: UIViewController {

    //MARK: Outlets
    @IBOutlet private weak var stapperWork: UIStepper!
    @IBOutlet private weak var stepsLabel: UILabel!
    @IBOutlet private weak var progressBar: UIProgressView!
    @IBOutlet private weak var progressButoon: UIButton!
    
    //MARK: Variable Declaration
    var isRed = false
    var isRunning = false
    var progressBarTimer: Timer!
    
    //MARK: LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //MARK: InitialSetUpCall
        initialSetUp()
    }
}

//MARK: Extension for initialSetUp
extension StapperVc {
    
    func initialSetUp() {
        //Stapper Image set
        stapperWork.setIncrementImage( .checkmark , for: .normal)
        stapperWork.backgroundColor = .white
        stapperWork.setDecrementImage( .remove, for: .normal )
        //stapperWork.backgroundColor = UIColor(named: "Light Sky")
        stapperWork.stepValue = 10
        
        //ProgereaaBar SetUp
        progressBar.progress = 0.0
        progressBar.transform = progressBar.transform.scaledBy(x: 1, y: 1)
        
        progressBar.layer.cornerRadius = 8
        progressBar.clipsToBounds = true
    }
}

//MARK: Extension for Actions
extension StapperVc {
    
    @IBAction func stepCheange(_ sender: Any) {
        stepsLabel.text = String(stapperWork.value)
    }
    
    @IBAction func progressAction(_ sender: Any) {
        if isRunning {
            progressBarTimer.invalidate()
            progressButoon.setTitle("Start", for: .normal)
        } else {
            progressButoon.setTitle("Stop", for: .normal)
            progressBar.progress = 0.0
            self.progressBarTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(StapperVc.updateProgressView), userInfo: nil, repeats: true)
            if (isRed) {
                progressBar.tintColor = .blue
                progressBar.progressViewStyle = .default
            } else {
                progressBar.tintColor = .red
                progressBar.progressViewStyle = .bar
            }
            isRed = !isRed
        }
        isRunning = !isRunning
    }
    
    @objc func updateProgressView() {
        progressBar.progress += 0.2
        progressBar.setProgress(progressBar.progress, animated: true)
        if progressBar.progress == 1 {
            progressBarTimer.invalidate()
            isRunning = false
            progressButoon.setTitle("Start", for: .normal)
        }
    }
}
