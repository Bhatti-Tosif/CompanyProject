//
//  SearchBarVc.swift
//  CompanyProject
//
//  Created by Tosif Bhatti on 31/03/23.
//

import UIKit

class SearchBarVc: UIViewController {

    //MARK: Outlets
    @IBOutlet private weak var searchBarOutlet: UISearchBar!
    @IBOutlet private weak var tabelOutlet: UITableView!
    
    //MARK: Variable Declaration
    var languages = ["Hindi", "Gujarati", "English US", "English UK", "Urdu", "Arabi", "French", "German", "Tamil", "Marathi", "Kannad"]
    var searching: Bool?
    var filterArray = Array<String>()
    
    //MARK: LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //MARK: InitialSetUpCall
        initialSetUp()
    }

}

//MARK: Extension for initialSetUp
extension SearchBarVc {
    
    func initialSetUp() {
        tabelOutlet.dataSource = self
        searchBarOutlet.delegate = self
        searchBarOutlet.showsScopeBar = true
        searchBarOutlet.scopeButtonTitles = ["name", "Surname"]
    }
    
}

//MARK: Extension for UITableViewDataSource
extension SearchBarVc: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if(searching ?? false) {
            return filterArray.count
        } else {
            return languages.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tabelOutlet.dequeueReusableCell(withIdentifier: R.reuseIdentifier.searchBarCell.identifier) as? SearchBarCell else {
            return UITableViewCell()
        }
        if(searching ?? false) {
            cell.textLabel?.text = filterArray[indexPath.row]
        } else {
            cell.textLabel?.text = languages[indexPath.row]
        }
        return cell
    }

}

//MARK: Extension for UISearchBarDelegate
extension SearchBarVc: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if(searchText.isEmpty) {
            filterArray = languages
        } else {
            filterArray = languages.filter {
                $0.lowercased().contains(searchText.lowercased())
            }
        }
        searching = true
        tabelOutlet.reloadData()
    }
    
    func searchBarShouldBeginEditing(_ searchBar: UISearchBar) -> Bool {
        languages.append("Start")
        tabelOutlet.reloadData()
        return true
    }
}
