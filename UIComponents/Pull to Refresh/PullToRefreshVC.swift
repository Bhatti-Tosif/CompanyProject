//
//  PullToRefreshVC.swift
//  CompanyProject
//
//  Created by Tosif Bhatti on 31/03/23.
//

import UIKit

class PullToRefreshVC: UIViewController {

    //MARK: Outlets
    @IBOutlet private weak var tableViewOutlet: UITableView!
    
    //MARK: Variable Declaration
    var detailArray: [String] = []
    var itemNo = 0
    let refrenceControll = UIRefreshControl()
    
    //MARK: LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //MARK: InitialSetUpCall
        initialSetUp()
    }

}

//MARK: Extension for initialSetUp
extension PullToRefreshVC {
    
    func initialSetUp() {
        tableViewOutlet.dataSource = self
        tableViewOutlet.refreshControl = refrenceControll
        refrenceControll.addTarget(self, action: #selector(refreshData), for: .valueChanged)
        refrenceControll.tintColor = .link
        refrenceControll.attributedTitle = NSAttributedString(string: "Refreshing")
    }
    
    @objc func refreshData() {
        itemNo += 1
        detailArray.append("item " + itemNo.description)
        tableViewOutlet.reloadData()
        refrenceControll.endRefreshing()
    }
    
}

//MARK: Extension for UITableViewDataSource
extension PullToRefreshVC: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableViewOutlet.dequeueReusableCell(withIdentifier: "refreshCell") as? RefreshCell else {
            return UITableViewCell()
        }
        cell.textLabel?.text = detailArray[indexPath.row]
        return cell
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return detailArray.count
    }
    
}
