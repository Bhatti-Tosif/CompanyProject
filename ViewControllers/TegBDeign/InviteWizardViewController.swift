//
//  InviteWizardViewController.swift
//  CompanyProject
//
//  Created by Tosif Bhatti on 27/03/23.
//

import UIKit

class InviteWizardViewController: UIViewController {

    //MARK: All Outlets
    @IBOutlet private weak var tableViewForInvite: UITableView!
    
    //MARK: Variable Declaration
    var selectedIndex = -1
    var isCollapse = false
    //User 1 Information
    let user1: [UserDetail] = [UserDetail(brandName: "Bill McDonald", userName: "<Display Name>", userEmail: "quickcam@gmail.com", userContact: "+91 9230773896", chanelname: "@ChanelName", signUpDate: "12 jan 2023", totalRefarals: "2", totalSubscribers: "2")]
    let userTask: [SectionHeader] = [SectionHeader(headerName: "10 Jan 2023", sectionMessage: "Selected message Appear here download quick cam app to check exsiting feature", openedDate: "11 Jan 2022"),
                                     SectionHeader(headerName: "10 Jan 2023", sectionMessage: "Selected multiple items", openedDate: "11 Jan 2022"),
                                     SectionHeader(headerName: "10 Jan 2023", sectionMessage: "Selected multiple items", openedDate: "11 Jan 2022"),
                                     SectionHeader(headerName: "10 Jan 2023", sectionMessage: "Selected multiple items", openedDate: "11 Jan 2022")]

    //MARK: LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()

        tableViewForInvite.dataSource = self
        tableViewForInvite.delegate = self
        
        //Allow multiple selection.
        tableViewForInvite.allowsMultipleSelection = true
        
        StatusBar.changeStatusBarColor(color: .white)
        
//        tableViewForInvite.estimatedRowHeight = 130
//        tableViewForInvite.rowHeight = UITableView.automaticDimension
        navigationApperance()
    }
    
    func navigationApperance() {
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = UIColor.white
        appearance.titleTextAttributes = [.foregroundColor: UIColor.link]
        navigationItem.title = "Invite Wizards"
        navigationItem.standardAppearance = appearance
        navigationItem.standardAppearance = appearance
        navigationItem.compactAppearance = appearance
        
        navigationController?.navigationBar.tintColor = .link
    }

}

//MARK: Extensions for UITableViewDataSource
extension InviteWizardViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return user1.count + userTask.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            guard let cell = tableViewForInvite.dequeueReusableCell(withIdentifier: "InviteWizedCell", for: indexPath) as? InviteWizardTablecell else {
                return UITableViewCell()
            }
            cell.configure(detail: user1[indexPath.row])
            return cell
        } else {
            guard let cell = tableViewForInvite.dequeueReusableCell(withIdentifier: "userTask", for: indexPath) as? InviteWizardUserTask else {
                return UITableViewCell()
            }
            cell.configureTask(task: userTask[indexPath.row - 1])
            return cell
        }
    }
}

//MARK: Extension for UITableViewDelegate
extension InviteWizardViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        print("didSelect")
        self.tableViewForInvite.performBatchUpdates(nil)
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("didDeSelect")
        self.tableViewForInvite.performBatchUpdates(nil)
    }
    
}


