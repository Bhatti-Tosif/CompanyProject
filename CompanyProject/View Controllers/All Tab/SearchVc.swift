//
//  SearchVc.swift
//  CompanyProject
//
//  Created by Tosif Bhatti on 10/04/23.
//

import UIKit

class SearchVc: UIViewController {
    
    //MARK: Outlets
    @IBOutlet weak var imageScrollCollectionView: UICollectionView!
    @IBOutlet weak var posterPageControll: UIPageControl!
    @IBOutlet weak var doctorTable: UITableView!
    @IBOutlet var headeofTabel: UIView!
    @IBOutlet weak var collectionViewInHeader: UICollectionView!
    
    //MARK: ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //MARK: tag
        imageScrollCollectionView.tag = 1
        collectionViewInHeader.tag = 2
        
        //tableView headeView
        doctorTable.tableHeaderView = headeofTabel
        
        //MARK: Give dataSource Delegate
        doctorTable.dataSource = self
        collectionViewInHeader.dataSource = self
        imageScrollCollectionView.dataSource = self
        collectionViewInHeader.delegate = self
        imageScrollCollectionView.delegate = self
        
        

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
   
}

//MARK: TableviewDataSource Delegate
extension SearchVc: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableDetail.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = doctorTable.dequeueReusableCell(withIdentifier: DoctorDetailTableCell.tableIdentifier) as? DoctorDetailTableCell else {
            return UITableViewCell()
        }
        cell.configure(detail: tableDetail[indexPath.row])
        return cell
    }
}

//MARK: ColleCtionView DataSource
extension SearchVc: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView.tag {
        case 1:
            return scrollingImages.count
        case 2:
            return collectionDetail.count
        default:
            print("Wrong tag")
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch collectionView.tag {
        case 1:
            guard let scrollingCell = imageScrollCollectionView.dequeueReusableCell(withReuseIdentifier: ScrollImageCell.imgCellIdentifier, for: indexPath) as? ScrollImageCell else { return UICollectionViewCell() }
            scrollingCell.scrollImg.image = UIImage(named: scrollingImages[indexPath.row])
            return scrollingCell
        case 2:
            guard let collectionCell = collectionViewInHeader.dequeueReusableCell(withReuseIdentifier: DoctorCollectionCell.collectionIdentifier, for: indexPath) as? DoctorCollectionCell else { return UICollectionViewCell() }
            collectionCell.configure(detail: collectionDetail[indexPath.row])
            return collectionCell
        default:
            print("Wrong cell")
        }
       return UICollectionViewCell()
    }
}

//MARK: CollectionViewFlowLayoutDelegate
extension SearchVc: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        switch collectionView.tag {
        case 1:
            print("case1")
            return CGSize(width: view.frame.width - 10 , height: view.frame.height)
        case 2:
            print("case 2")
            return CGSize(width: view.frame.width / 3 - 20, height: view.frame.height)
        default:
            print("Wrong Size")
        }
        return CGSize()
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        switch collectionView.tag {
        case 1:
            return 10
        case 2:
            return 20
        default:
            print("Wrong Size")
        }
        return 0
    }
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        switch collectionView.tag {
        case 1:
            posterPageControll.currentPage = indexPath.row
        case 2:
            fallthrough
        default:
            print("")
        }
        
    }
}
