//
//  FirstScreen.swift
//  CompanyProject
//
//  Created by Tosif Bhatti on 20/03/23.
//

import UIKit

class FirstScreen: UIViewController {

    //MARK: LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        print("did load 2")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        print("will 2")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        print("did 2")
    }
        
    override func viewWillDisappear(_ animated: Bool) {
        print("Dis will 2")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        print("dis did 2")
    }

}

extension FirstScreen {
    
    @IBAction func InviteWizardClick(_ sender: Any) {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Invite Wizards", bundle: nil)
        guard let vc = storyBoard.instantiateViewController(withIdentifier: "InviteWizardViewController") as? InviteWizardViewController else { return }
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func uiComponentClick(_ sender: Any) {
        let storyBoardComponents: UIStoryboard = UIStoryboard(name: "AllComponents", bundle: nil)
        guard let vc = storyBoardComponents.instantiateViewController(withIdentifier: "MainViewController") as? MainViewController else { return }
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func scheduleMeetingClick(_ sender: Any) {
        let storyBoardScheduleMeeting: UIStoryboard = UIStoryboard(name: "ScheduleMeeting", bundle: nil)
        guard let vc = storyBoardScheduleMeeting.instantiateViewController(withIdentifier: "ScheduleMeetingVc") as? ScheduleMeetingVc else { return }
        navigationController?.pushViewController(vc, animated: true)
    }
    
    
    @IBAction func practiceClicked(_ sender: Any) {
        let storyBoardPractice: UIStoryboard = UIStoryboard(name: "Practice", bundle: nil)
        guard let vc = storyBoardPractice.instantiateViewController(withIdentifier: "PracticeVc") as? PracticeVc else { return }
        navigationController?.pushViewController(vc, animated: true)
        
    }
}
