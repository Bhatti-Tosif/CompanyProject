//
//  GetStartedVc.swift
//  CompanyProject
//
//  Created by Tosif Bhatti on 11/04/23.
//

import UIKit

class GetStartedVc: UIViewController {

    //MARK: Outlets
    
    @IBOutlet weak var collectionViewforStart: UICollectionView!
    @IBOutlet weak var getStartpageControll: UIPageControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        collectionViewforStart.dataSource = self
        collectionViewforStart.delegate = self
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    //MARK: Actions
    
    @IBAction func getStartPress(_ sender: Any) {
        guard let vc = self.storyboard?.instantiateViewController(withIdentifier: "MainTabBarController") as? MainTabBarController else { return }
        navigationController?.pushViewController(vc, animated: true)
    }
    
}

//extension GetStartedVc: UICollectionViewDataSource {
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return getStartDetail.count
//    }
//
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        guard let startCell = collectionViewforStart.dequeueReusableCell(withReuseIdentifier: getStartCell.identifier, for: indexPath) as? getStartCell else { return UICollectionViewCell() }
//        //startCell.configure()
//    }
//
//}

extension GetStartedVc: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return getStartDetail.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let startCell = collectionViewforStart.dequeueReusableCell(withReuseIdentifier: getStartCell.identifier, for: indexPath) as? getStartCell else { return UICollectionViewCell() }
        startCell.configure(detail: getStartDetail[indexPath.row])
        
        return startCell
    }
    
    
}
extension GetStartedVc: UICollectionViewDelegateFlowLayout, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        getStartpageControll.currentPage = indexPath.row
    }
}
