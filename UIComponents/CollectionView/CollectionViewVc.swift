//
//  CollectionViewVc.swift
//  CompanyProject
//
//  Created by Tosif Bhatti on 05/04/23.
//

import UIKit

class CollectionViewVc: UIViewController {

    //MARK: Outlets
    @IBOutlet private weak var collectionOutlet: UICollectionView!
    
    //MARK: Variable Declaration
    var avengerImages = ["iron-man-2", "iron-man-3", "iron-man", "age-of-ultron", "endgame", "infinity-war", "iron-man-2", "iron-man-2", "iron-man-3", "iron-man", "age-of-ultron", "endgame", "infinity-war", "iron-man-2", "iron-man-2", "iron-man-3", "iron-man", "age-of-ultron", "endgame", "infinity-war", "iron-man-2"]
    let labelForimage = ["iron-man-2", "iron-man-3", "iron-man", "age-of-ultron", "endgame", "infinity-war", "iron-man-2", "iron-man-2", "iron-man-3", "iron-man", "age-of-ultron", "endgame", "infinity-war", "iron-man-2", "iron-man-2", "iron-man-3", "iron-man", "age-of-ultron", "endgame", "infinity-war", "iron-man-2"]
    
    //MARK: LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()

        //MARK: InitialSetUpCall
        initialSetUp()
    }
    
}

//MARK: Extension for initialSetUp
extension CollectionViewVc {
    
    func initialSetUp() {
        collectionOutlet.dataSource = self
        collectionOutlet.delegate = self
    }
    
}

//MARK: Extension for UICollectionViewDelegate, UICollectionViewDataSource
extension CollectionViewVc: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionOutlet.dequeueReusableCell(withReuseIdentifier: R.reuseIdentifier.collectionCell.identifier, for: indexPath) as? CollectionCell else {
            return UICollectionViewCell()
        }
        cell.confige(imageString: avengerImages[indexPath.row], labelText: labelForimage[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return avengerImages.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let imageDetail = self.storyboard?.instantiateViewController(withIdentifier: R.storyboard.controller.dataPasingVc) as? DataPasingVc else { return }
        imageDetail.msgImage = avengerImages[indexPath.row]
        imageDetail.msgDetail = labelForimage[indexPath.row]
        navigationController?.pushViewController(imageDetail, animated: true)
    }
    
}

//MARK: Extension for UICollectionViewDelegateFlowLayout
extension CollectionViewVc: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
       // let collectionWidth = collectionOutlet.bounds.width
        return CGSize(width: view.frame.size.width / 3 - 5 , height: view.frame.size.height / 3 - 10)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
}
