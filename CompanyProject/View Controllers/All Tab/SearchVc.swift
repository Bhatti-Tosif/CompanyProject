//
//  SearchVc.swift
//  CompanyProject
//
//  Created by Tosif Bhatti on 10/04/23.
//

import UIKit

class SearchVc: UIViewController {
    
    //MARK: Outlets
    @IBOutlet weak var posterImage: UIImageView!
    @IBOutlet weak var posterPageControll: UIPageControl!
    @IBOutlet weak var doctorTable: UITableView!
    @IBOutlet var headeofTabel: UIView!
    @IBOutlet weak var collectionViewInHeader: UICollectionView!
    
    //MARK: ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //MARK: Image Corner
        posterImage.layer.cornerRadius = 20
        
        //tableView headeView
        doctorTable.tableHeaderView = headeofTabel
        
        //MARK: Give dataSource Delegate
        doctorTable.dataSource = self
        collectionViewInHeader.dataSource = self

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
    @IBAction func imageChange(_ sender: Any) {
        switch posterPageControll.currentPage {
        case 0:
            posterImage.image = UIImage(named: "poster1")
        case 1:
            posterImage.image = UIImage(named: "poster3")
        case 2:
            posterImage.image = UIImage(named: "poster1")
        default:
            print("Wrong Page Index")
        }
    }
}

//MARK: TableviewDataSource Delegate
extension SearchVc: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      return 5
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = doctorTable.dequeueReusableCell(withIdentifier: DoctorDetailTableCell.tableIdentifier) as? DoctorDetailTableCell else {
            return UITableViewCell()
        }
        cell.textLabel?.text = "Test"
        return cell
    }
}

//MARK: ColleCtionView DataSource
extension SearchVc: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return collectionDetail.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let collectionCell = collectionViewInHeader.dequeueReusableCell(withReuseIdentifier: DoctorCollectionCell.collectionIdentifier, for: indexPath) as? DoctorCollectionCell else { return UICollectionViewCell() }
        
        collectionCell.configure(detail: collectionDetail[indexPath.row])
        return collectionCell
    }
}

//MARK: CollectionViewFlowLayoutDelegate
extension SearchVc: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: view.frame.width / 3 - 20, height: view.frame.height)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
}
