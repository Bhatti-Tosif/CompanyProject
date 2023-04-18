//
//  TableViewPractice.swift
//  CompanyProject
//
//  Created by Tosif Bhatti on 23/03/23.
//

import UIKit

class TableViewPractice: UIViewController, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    let data = ["New York, NY", "Los Angeles, CA", "Chicago, IL", "Houston, TX",
          "Philadelphia, PA", "Phoenix, AZ", "San Diego, CA", "San Antonio, TX",
          "Dallas, TX", "Detroit, MI", "San Jose, CA", "Indianapolis, IN",
          "Jacksonville, FL", "San Francisco, CA", "Columbus, OH", "Austin, TX",
          "Memphis, TN", "Baltimore, MD", "Charlotte, ND", "Fort Worth, TX"]
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        <#code#>
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        <#code#>
    }
    

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
