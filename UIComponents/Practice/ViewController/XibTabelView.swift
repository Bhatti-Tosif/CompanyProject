//
//  XibTabelView.swift
//  CompanyProject
//
//  Created by Tosif Bhatti on 07/04/23.
//

import UIKit

class XibTabelView: UIViewController {

    //MARK: Outlets
    @IBOutlet private weak var xibTableView: UITableView!
    
    //MARK: Variable Declaration
    var avengerImages = ["iron-man-2", "iron-man-3", "iron-man", "age-of-ultron", "endgame", "infinity-war", "iron-man-2", "iron-man-2", "iron-man-3", "iron-man"]
    let labelText = ["iron-man-2", "iron-man-3", "iron-man", "age-of-ultron", "endgame", "infinity-war", "iron-man-2", "iron-man-2", "iron-man-3", "iron-man"]
    
    //MARK: LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //MARK: InitialSetUpCall
        initialSetUp()
    }

}
//MARK: Extension for initialSetUp
extension XibTabelView {
    
    //MARK: InitialSetUp
    func initialSetUp() {
        let nib = UINib(nibName: "xibThroughTabelCell", bundle: nil)
        xibTableView.register(nib, forCellReuseIdentifier: "xibCell")
        xibTableView.dataSource = self
        xibTableView.delegate = self
    }
    
}

//MARK: Extension for UITableViewDataSource
extension XibTabelView: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return avengerImages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let xibCell = xibTableView.dequeueReusableCell(withIdentifier: "xibCell") as? xibThroughTabelCell else {
            return UITableViewCell()
        }
        xibCell.configure(img: avengerImages[indexPath.row], lbl: labelText[indexPath.row])
        
        return xibCell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .insert {
            avengerImages.remove(at: indexPath.row)
            xibTableView.deleteRows(at: [indexPath], with: .fade)
        }
        xibTableView.reloadData()
    }
    
}

//MARK: Extension for UITableViewDelegate
extension XibTabelView: UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let archive = UIContextualAction(style: .normal , title: "Archive", handler: {_,_,_ in
            print("Arcive")
        })
        archive.backgroundColor = .blue
        return UISwipeActionsConfiguration(actions: [archive])
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return "First"
        case 1:
            return "Second"
        default:
            return "false"
        }
        
    }
}
