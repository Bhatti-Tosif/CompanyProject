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
    private let components = ["Table View", "Xib TableView", "Before Kt", "After Reverse Kt"]
    
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
        guard let cell = practiceTabelView.dequeueReusableCell(withIdentifier: R.reuseIdentifier.practiceCell.identifier) else { return UITableViewCell() }
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
            guard let vc = self.storyboard?.instantiateViewController(withIdentifier: R.storyboard.practice.tabelPracticeVc) as? TabelPracticeVc else { return }
            navigationController?.pushViewController(vc, animated: true)
        case 1:
            guard let vc = self.storyboard?.instantiateViewController(withIdentifier: R.storyboard.practice.xibTabelView) as? XibTabelView else { return }
            navigationController?.pushViewController(vc, animated: true)
        case 2:
            guard let vc = self.storyboard?.instantiateViewController(withIdentifier: R.storyboard.practice.reverseBeforePractice) as? ReverseBeforePractice else { return }
            navigationController?.pushViewController(vc, animated: true)
        case 3:
            guard let vc = self.storyboard?.instantiateViewController(withIdentifier: R.storyboard.practice.afterReverseKtVC) as? AfterReverseKtVC else { return }
            navigationController?.pushViewController(vc, animated: true)
        default:
            print("wrong")
        }
    }
    
}
