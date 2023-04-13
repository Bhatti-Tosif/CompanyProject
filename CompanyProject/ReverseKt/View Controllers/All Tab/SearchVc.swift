//
//  SearchVc.swift
//  CompanyProject
//
//  Created by Tosif Bhatti on 10/04/23.
//

import UIKit

class SearchVc: UIViewController {
    
    //MARK: Outlets
    @IBOutlet weak var collectionForAutoScrollImg: UICollectionView!
    @IBOutlet weak var posterPageControll: UIPageControl!
    @IBOutlet weak var tblDoctor: UITableView!
    @IBOutlet weak var headeofTabel: UIView!
    @IBOutlet weak var collectionViewInHeader: UICollectionView!
    @IBOutlet weak var innerView: UIView!
    @IBOutlet weak var btnNotification: UIButton!
    
    //MARK: Variable Declaration
    var timer: Timer?
    var currentIndex = 0
    
    //MARK: ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //MARK: Initial SetUp
        initialSetUp()
    
    }
    
}

//MARK: Extensions for give all function
extension SearchVc {
    
    func initialSetUp() {
        //corner bellView
        innerView.layer.cornerRadius = innerView.frame.height / 2
        
        //MARK: Give dataSource Delegate
        tblDoctor.dataSource = self
        collectionViewInHeader.dataSource = self
        collectionForAutoScrollImg.dataSource = self
        collectionViewInHeader.delegate = self
        collectionForAutoScrollImg.delegate = self
        tblDoctor.delegate = self
        
        //Swipe automaticaly
        startTimer()
        tblDoctor.sectionHeaderTopPadding = CGFloat(ConstantHandle.tblDoctorSectionHeaderTopPadding)
        
        //Number of page controll
        posterPageControll.numberOfPages = scrollingImages.count
        
        //Navigation Hide
        navigationController?.isNavigationBarHidden = true
        
        //PageControl dot size reduce
        for dot in posterPageControll.subviews{
            dot.transform = CGAffineTransform.init(scaleX: 1/1.2, y: 1/1.2)
        }
    }
    
    func startTimer() {
        timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(timerAction), userInfo: nil, repeats: true)
    }
    
    @objc func timerAction() {
        currentIndex = currentIndex < scrollingImages.count - 1 ? currentIndex + 1 : 0
        posterPageControll.currentPage = currentIndex
        collectionForAutoScrollImg.scrollToItem(at: IndexPath(item: currentIndex, section: 0), at: .centeredHorizontally, animated: true)
    }
    
    func configureSectionHeader(_ sectionHeader: UIView) {
        let sectionTitle = UILabel(frame: CGRect(x: 10, y: 0, width: view.frame.size.width / 1.8, height: 20))
        sectionTitle.font = UIFont.systemFont(ofSize: 17, weight: .bold)
        let btnSeeAll = UIButton(frame: CGRect(x: view.frame.size.width - 90, y: 0, width: 100, height: 20))
        btnSeeAll.setTitle("See All ", for: .normal)
        btnSeeAll.setTitleColor( .systemBlue, for: .normal)
        btnSeeAll.titleLabel?.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        sectionTitle.text = "Recomondation Doctor"
        sectionHeader.addSubview(sectionTitle)
        sectionHeader.addSubview(btnSeeAll)
    }
    
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

//MARK: TableviewDataSource Delegate
extension SearchVc: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableDetail.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tblDoctor.dequeueReusableCell(withIdentifier: DoctorDetailTableCell.tableIdentifier) as? DoctorDetailTableCell else {
            return UITableViewCell()
        }
        cell.configure(detail: tableDetail[indexPath.row])
        return cell
    }

}

//MARK: TableView Delegates
extension SearchVc:UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return CGFloat(ConstantHandle.heightForHeaderInSection)
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
        switch collectionView {
        case collectionForAutoScrollImg:
            return scrollingImages.count
        case collectionViewInHeader:
            return collectionDetail.count
        default:
            print("Wrong tag")
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch collectionView {
        case collectionForAutoScrollImg:
            guard let scrollingCell = collectionForAutoScrollImg.dequeueReusableCell(withReuseIdentifier: ScrollImageCell.imgCellIdentifier, for: indexPath) as? ScrollImageCell else { return UICollectionViewCell() }
            scrollingCell.imgScrolling.image = UIImage(named: scrollingImages[indexPath.row])
            return scrollingCell
        case collectionViewInHeader:
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
        switch collectionView {
        case collectionForAutoScrollImg:
            return CGSize(width: self.view.frame.width , height: collectionView.frame.height)
        case collectionViewInHeader:
            return CGSize(width: self.view.frame.size.width / 4 - 15, height: collectionView.frame.size.height)
        default:
            print("Wrong Size")
        }
        return CGSize()
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        switch collectionView {
        case collectionForAutoScrollImg:
            return 0
        case collectionViewInHeader:
            return 5
        default:
            print("Wrong Size")
        }
        return 0
    }
}
