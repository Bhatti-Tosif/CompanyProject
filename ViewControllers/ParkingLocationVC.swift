//
//  ParkingLocationVC.swift
//  CompanyProject
//
//  Created by Tosif Bhatti on 24/03/23.
//

import UIKit

class ParkingLocationVC: UIViewController{
    
    
    
    
    //MARK: Outlet
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var buttonView: UIView!
    
    var selectedItem = 0
    
    
    let parkingInfoData: [ParkingData] = [ParkingData(parkingCode: "24581", parkingName: "179 W Washington St.", parkingAddress: "1280, St. NE, DC Road cghdgdrdfghdgbd, 20001", carImage: "icone"),
                                          ParkingData(parkingCode: "24581", parkingName: "179 W Washington St.", parkingAddress: "1280, St. NE, DC Road, 20001", carImage: "icone"),
                                          ParkingData(parkingCode: "24581", parkingName: "179 W Washington St.", parkingAddress: "", carImage: "icone"),
                                          ParkingData(parkingCode: "24581", parkingName: "179 W Washington St.", parkingAddress: "1280, St. NE, DC Road, 20001", carImage: "icone"),
                                          ParkingData(parkingCode: "24581", parkingName: "179 W Washington St.", parkingAddress: "1280, St. NE, DC Road, 20001", carImage: "icone"),
                                          ParkingData(parkingCode: "24581", parkingName: "179 W Washington St.", parkingAddress: "1280, St. NE, DC Road, 20001", carImage: "bluryImage"),]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        
        //Change StatusBar Color
    
        StatusBar.changeStatusBarColor(color: UIColor(named: "deepAqua") ?? .white)
        navigationApperance()
    }
    
    
    @IBAction func btn_Back(_ sender: Any) {
        exitVc()
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    func navigationApperance() {
        let apperance = UINavigationBarAppearance()
        apperance.backgroundColor = UIColor(named: "deepAqua")
        navigationItem.title = "Parking Location"
        apperance.titleTextAttributes = [.foregroundColor: UIColor.white]
        navigationItem.standardAppearance = apperance
        navigationItem.scrollEdgeAppearance = apperance
        navigationController?.navigationBar.tintColor = .white
    }
    
    @objc func exitVc() {
        navigationController?.popViewController(animated: true)
    }

}
extension ParkingLocationVC: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? ParkingLocationDataTableViewCell else {
            return UITableViewCell()
        }
        cell.configure(data: parkingInfoData[indexPath.row])
        
        //MARK: Allow Multiple selection
        self.tableView.allowsMultipleSelection = true
        //self.tableView.allowsMultipleSelection = true

        return cell
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return parkingInfoData.count
    }
}
extension ParkingLocationVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //MARK: Give backgroubnd color..
        selectedItem += 1
        buttonView.isHidden = false
    }
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        selectedItem -= 1
        if(selectedItem == 0) {
            buttonView.isHidden = true
        }
    }
}
