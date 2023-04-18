//
//  TableViewPracticeViewController.swift
//  CompanyProject
//
//  Created by Tosif Bhatti on 23/03/23.
//

import UIKit

class TableViewPracticeViewController: UIViewController, UITableViewDataSource {
    
    //MARK: Outlets
    @IBOutlet private weak var tableView: UITableView!
    
    //MARK: Variable Declaration
    let data = ["New York, NY", "Los Angeles, CA", "Chicago, IL", "Houston, TX", "Philadelphia, PA", "Phoenix, AZ", "San Diego, CA", "San Antonio, TX", "Dallas, TX", "Detroit, MI", "San Jose, CA", "Indianapolis, IN", "Jacksonville, FL", "San Francisco, CA", "Columbus, OH", "Austin, TX", "Memphis, TN", "Baltimore, MD", "Charlotte, ND", "Fort Worth, TX"]
    let data2 = [("Arizona", ["Phoenix"]),
           ("California", ["Los Angeles", "San Francisco", "San Jose", "San Diego"]),
           ("Florida", ["Miami", "Jacksonville"]),
           ("Illinois", ["Chicago"]),
           ("New York", ["Buffalo", "New York"]),
           ("Pennsylvania", ["Pittsburg", "Philadelphia"]),
           ("Texas", ["Houston", "San Antonio", "Dallas", "Austin", "Fort Worth"])]
    var checked: [Bool]!
    let CellIdentifier = "cell", HeaderViewIdentifier = "TableViewHeader"
    
    //MARK: LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        //tableView.delegate = self
        
        checked = [Bool](repeating: false, count: data.count)
        //tableView.register(UITableViewHeaderFooterView.self, forHeaderFooterViewReuseIdentifier: HeaderViewIdentifier)
        //tableView.register(UITableViewCell.self, forCellReuseIdentifier: CellIdentifier)
        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        checked[indexPath.row] = !checked[indexPath.row]
        tableView.reloadRows(at: [indexPath], with: .automatic)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell1 = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! PracticeTableViewCell
        //let cell2 = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let cityState = data[indexPath.row].components(separatedBy: ", ")
        //cell1.textLabel?.text = data[indexPath.row]
        cell1.cityLable.text = cityState.first
        cell1.stateLable.text = cityState.last
        
        if checked[indexPath.row] {
            cell1.accessoryType = .detailButton
        } else {
            print("none")
            cell1.accessoryType = .none
        }
        //let citiesInsection = data2[indexPath.section].1
        //cell2.textLabel?.text = citiesInsection[indexPath.row]
        
        //Accessory
        //let greyLevel = CGFloat(indexPath.row % 5) / 5.0
        //cell2.accessoryView?.backgroundColor = UIColor(white: greyLevel, alpha: 1)
        return cell1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
//    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: HeaderViewIdentifier)!
//        header.textLabel?.text = data2[section].0
//        return header
//    }
//    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
//        return 50
//    }

}
