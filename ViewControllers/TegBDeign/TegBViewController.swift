//
//  TegBViewController.swift
//  CompanyProject
//
//  Created by Tosif Bhatti on 22/03/23.
//

import UIKit

class TegBViewController: UIViewController, UITableViewDataSource {
    
    //MARK: Outlets
    @IBOutlet private weak var tableView: UITableView!
    
    //MARK: Variable Declaration
    let data: [LeaveData] = [
        LeaveData(request: "Oct 18, 2022", start: "Nov 01, 2022", end: "Nov 03, 2022 bjsfkfhekfbhkfhwikfbhwikfbhwefikbgkfhjnskfhv", status: "Approved", action: "Oct 20, 2022", reason: "Planing for Trip"),
        LeaveData(request: "Oct 18, 2022", start: "Feb 28, 2023", end: "Mar 10, 2023", status: "Cancelled", action: "Oct 20, 2022", reason: "Planing for Trip hlsfhlsdfhfogohiosfghsdkfihsdfkhsdefheofhefhfehfewhfwh"),
        LeaveData(request: "Oct 18, 2022", start: "Nov 01, 2022", end: "Nov 03, 2022", status: "Rejected", action: "Oct 20, 2022", reason: "Planing for Trip hlsfhlsdfhfogohiosfghsdkfihsdfkhsdefheofhefhfehfewhfwh"),
        LeaveData(request: "fsfgsgf 2022", start: "Feb 28, 2023", end: "Mar 10, 2023", status: "", action: "Oct 20, 2022", reason: "Planing for Trip hlsfhlsdfhfogohiosfghsdkfihsdfkhsdefheofhefhfehfewhfwh"),
        LeaveData(request: "fsfgsgf 2022", start: "Feb 28, 2023", end: "", status: "", action: "Oct 20, 2022", reason: "Planing for Trip hlsfhlsdfhfogohiosfghsdkfihsdfkhsdefheofhefhfehfewhfwh")
    ]
    
    //MARK: Actions
    @IBAction func backClick(_ sender: Any) {
        exitVc()
    }
    //MARK: LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Change statusBar color
        StatusBar.changeStatusBarColor(color: R.color.deepAqua() ?? .white)
        
        tableView.dataSource = self
        title = "Leave Offset"
        //tableView.estimatedRowHeight = 50
        //tableView.rowHeight = 50
        //tableView.rowHeight = UITableView.automaticDimension
        
        //navigationController?.navigationBar.tintColor = .white
        
        navigationBarItemSpacing()
        navigationAppearance()
    }
    //let accessoryTypes: [UITableViewCell.AccessoryType] = [.none, .disclosureIndicator, .detailDisclosureButton, .checkmark, .detailButton]
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? CustomeTableViewCell else {
            return UITableViewCell()
        }
        
        cell.configure(data: data[indexPath.row])
        //cell.accessoryType = accessoryTypes[indexPath.row % accessoryTypes.count]

        
        switch(cell.status.text) {
        case "Approved":
            cell.status.textColor = R.color.coolGreen()
        case "Cancelled":
            cell.status.textColor = R.color.darkishPink()
        case "Rejected":
            cell.status.textColor = R.color.reddidh()
        default:
            cell.status.text = "-"
        }
        
        return cell
    }

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    @objc func exitVc() {
        navigationController?.popViewController(animated: true)
    }
    
    private func navigationBarItemSpacing() {
        
        navigationController?.navigationItem.rightBarButtonItem?.imageInsets = UIEdgeInsets(top: 0, left: -10, bottom: 0, right: -10)

//        navigationItem.rightBarButtonItems = [
//            UIBarButtonItem(
//                image: UIImage(named: "iconFilter"),
//                style: .done,
//                target: self,
//                action: nil),
//            UIBarButtonItem(
//                barButtonSystemItem: .add,
//                target: self,
//                action: nil)
//        ]
//        navigationItem.leftBarButtonItem = UIBarButtonItem(
//            image: UIImage(named: "iconArrowBack"),
//            style: .plain,
//            target: self,
//            action: nil)
    }
    func navigationAppearance() {
            let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = R.color.deepAqua()
            appearance.titleTextAttributes = [.foregroundColor: UIColor.white]
            //navigationItem.titleView?.tintColor = .white
            navigationItem.standardAppearance = appearance
            navigationItem.scrollEdgeAppearance = appearance
//            self.navigationController?.navigationBar.isTranslucent = true  // pass "true" for fixing iOS 15.0 black bg issue
//            self.navigationController?.navigationBar.tintColor = UIColor.white // We need to set tintcolor for iOS 15.0
//            appearance.shadowColor = .clear    //removing navigationbar 1 px bottom border.
//            UINavigationBar.appearance().standardAppearance = appearance
//            UINavigationBar.appearance().scrollEdgeAppearance = appearance
//            navigationController?.navigationBar.standardAppearance = appearance
    }

}

