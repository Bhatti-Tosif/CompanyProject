//
//  PracticeVc.swift
//  CompanyProject
//
//  Created by Tosif Bhatti on 06/04/23.
//

import UIKit

class PracticeVc: UIViewController {

    //MARK: Outlets
    @IBOutlet private weak var practiceTabelView: UITableView!
    
    //MARK: Variable Declaration
    private let components = ["Tabel View", "Xib TAbelView", "Scroll View", "Revers Kt Practice", "Before Kt", "After Reverse Kt"]
    
    //MARK: LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //MARK: TableView DataSOurce & Delegates
        practiceTabelView.dataSource = self
        practiceTabelView.delegate = self
    }
    
}

//MARK: Extension for TableviewDataSource
extension PracticeVc: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return components.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = practiceTabelView.dequeueReusableCell(withIdentifier: "cell") else { return UITableViewCell() }
        cell.textLabel?.text = components[indexPath.row]
        return cell
    }
    
}

//MARK: Extension for UITableViewDelegate
extension PracticeVc: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            guard let vc = self.storyboard?.instantiateViewController(withIdentifier: "TabelPracticeVc") as? TabelPracticeVc else { return }
            navigationController?.pushViewController(vc, animated: true)
        case 1:
            guard let vc = self.storyboard?.instantiateViewController(withIdentifier: "XibTabelView") as? XibTabelView else { return }
            navigationController?.pushViewController(vc, animated: true)
        case 3:
            guard let vc = self.storyboard?.instantiateViewController(withIdentifier: "ReverseKtPractice") as? ReverseKtPractice else { return }
            navigationController?.pushViewController(vc, animated: true)
        case 4:
            guard let vc = self.storyboard?.instantiateViewController(withIdentifier: "ReverseBeforePractice") as? ReverseBeforePractice else { return }
            navigationController?.pushViewController(vc, animated: true)
        case 5:
            guard let vc = self.storyboard?.instantiateViewController(withIdentifier: "AfterReverseKtVC") as? AfterReverseKtVC else { return }
            navigationController?.pushViewController(vc, animated: true)
        default:
            print("wrong")
        }
    }
    
}
