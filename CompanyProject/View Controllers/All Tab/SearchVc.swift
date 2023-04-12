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
    @IBOutlet weak var innerView: UIView!
    @IBOutlet weak var btnNotification: UIButton!
    
    //MARK: Variable Declare
    var timer: Timer?
    var currentIndex = 0
    
    //MARK: ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //MARK: tag
        imageScrollCollectionView.tag = 1
        collectionViewInHeader.tag = 2
        
        
        //corner bellView
        innerView.layer.cornerRadius = innerView.frame.height / 2
        
        //MARK: Give dataSource Delegate
        doctorTable.dataSource = self
        collectionViewInHeader.dataSource = self
        imageScrollCollectionView.dataSource = self
        collectionViewInHeader.delegate = self
        imageScrollCollectionView.delegate = self
        doctorTable.delegate = self
        
        //Swipe automaticaly
        startTimer()
        doctorTable.sectionHeaderTopPadding = 10
        
        //Number of page controll
        posterPageControll.numberOfPages = scrollingImages.count
        
        //Navigation Hide
        navigationController?.isNavigationBarHidden = true
        
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
    @IBAction func notificationTapped(_ sender: Any) {
        if btnNotification.isSelected {
            innerView.isHidden = true
            btnNotification.isSelected.toggle()
        } else {
            btnNotification.sizeToFit()
            innerView.isHidden = false
            btnNotification.isSelected.toggle()
        }
    }
    
}

//MARK: Extensions for give all function
extension SearchVc {
    func startTimer() {
        timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(timerAction), userInfo: nil, repeats: true)
    }
    
    @objc func timerAction() {
        currentIndex = currentIndex < scrollingImages.count - 1 ? currentIndex + 1 : 0
        posterPageControll.currentPage = currentIndex
        imageScrollCollectionView.scrollToItem(at: IndexPath(item: currentIndex, section: 0), at: .centeredHorizontally, animated: true)
    }
    
    func configureSectionHeader(_ sectionHeader: UIView) {
        let sectionTitle = UILabel(frame: CGRect(x: 20, y: 0, width: view.frame.size.width / 1.8, height: 20))
        sectionTitle.font = UIFont.systemFont(ofSize: 17, weight: .bold)
        let btnSeeAll = UIButton(frame: CGRect(x: view.frame.size.width - 110, y: 0, width: 100, height: 20))
        btnSeeAll.setTitle("See All ", for: .normal)
        btnSeeAll.setTitleColor(.tintColor, for: .normal)
        btnSeeAll.titleLabel?.font = UIFont.systemFont(ofSize: 12, weight: .semibold)
        sectionTitle.text = "Recomonded Doctor"
        sectionHeader.addSubview(sectionTitle)
        sectionHeader.addSubview(btnSeeAll)
    }
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
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
}

//MARK: TableView Delegates
extension SearchVc:UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 30
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let sectionHeader = UIView(frame: CGRect(x: 0, y: 50, width: view.frame.size.width, height: 50))
        configureSectionHeader(sectionHeader)
        return sectionHeader
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
            return CGSize(width: self.view.frame.width , height: collectionView.frame.height)
        case 2:
            return CGSize(width: self.view.frame.size.width / 4 - 20, height: collectionView.frame.size.height)
        default:
            print("Wrong Size")
        }
        return CGSize()
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        switch collectionView.tag {
        case 1:
            return 0
        case 2:
            return 5
        default:
            print("Wrong Size")
        }
        return 0
    }
}
