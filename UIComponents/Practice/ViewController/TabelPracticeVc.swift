//
//  TabelPracticeVc.swift
//  CompanyProject
//
//  Created by Tosif Bhatti on 07/04/23.
//

import UIKit

class TabelPracticeVc: UIViewController {

    //MARK: Outlets
    @IBOutlet private weak var tabelView: UITableView!
    @IBOutlet private weak var collectionOutlet: UICollectionView!
    @IBOutlet private weak var innerView: UIView!
    @IBOutlet private weak var imgProfile: UIImageView!
    
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
extension TabelPracticeVc {
    
    func initialSetUp() {
        tabelView.dataSource = self
        collectionOutlet.dataSource = self
        tabelView.estimatedRowHeight = 100
        tabelView.rowHeight = UITableView.automaticDimension
        
        navigationController?.navigationBar.backgroundColor = .systemCyan
        
        innerView.backgroundColor = .systemCyan
        innerView.layer.cornerRadius = 50
        innerView.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner ]
        
        imgProfile.layer.cornerRadius = 15
        
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = .systemCyan
        navigationItem.standardAppearance = appearance
        navigationItem.scrollEdgeAppearance = appearance
    }
    
}

//MARK: Extension for UITableViewDataSource
extension TabelPracticeVc: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return avengerImages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let practiceCell = tableView.dequeueReusableCell(withIdentifier: R.reuseIdentifier.tabelCell.identifier) as? TabelCellPractice else {
            return UITableViewCell()
        }
        practiceCell.configure(imageItem: avengerImages[indexPath.row], labelItem: labelText[indexPath.row])
        
        return practiceCell
    }
    
    
}

//MARK: Extension for UICollectionViewDataSource
extension TabelPracticeVc: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return avengerImages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let collectionCell = collectionOutlet.dequeueReusableCell(withReuseIdentifier: R.reuseIdentifier.collectionCellForHeader.identifier, for: indexPath) as? CollectionCellPractice else {
            return UICollectionViewCell()
        }
        collectionCell.configure(setImage: avengerImages[indexPath.row])
        return collectionCell
    }
}

