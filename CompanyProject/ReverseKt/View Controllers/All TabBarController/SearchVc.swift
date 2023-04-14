//
//  SearchVc.swift
//  CompanyProject
//
//  Created by Tosif Bhatti on 10/04/23.
//

import UIKit

class SearchVc: UIViewController {
    
    //MARK: Outlets
    @IBOutlet weak var collectionForAddPoster: UICollectionView!
    @IBOutlet weak var addPosterPageControll: UIPageControl!
    @IBOutlet weak var tblDoctor: UITableView!
    @IBOutlet weak var headerViewoOfTabel: UIView!
    @IBOutlet weak var collectionForSpecializationOfDr: UICollectionView!
    @IBOutlet weak var innerView: UIView!
    @IBOutlet weak var btnNotification: UIButton!
    
    //MARK: Variable Declaration
    var timer: Timer?
    var currentIndex = 0
    
    //MARK: LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //MARK: Initial SetUp
        initialSetUp()
        
    }
    
}

//MARK: InitialSetUp Extension
extension SearchVc {
    
    func initialSetUp() {
        //corner bellView
        innerView.layer.cornerRadius = innerView.frame.height / ConstantHandle.innerViewCornerRadius
        
        //MARK: Give dataSource Delegate
        tblDoctor.dataSource = self
        collectionForSpecializationOfDr.dataSource = self
        collectionForAddPoster.dataSource = self
        collectionForSpecializationOfDr.delegate = self
        collectionForAddPoster.delegate = self
        tblDoctor.delegate = self
        
        //Swipe automaticaly
        startTimer()
        tblDoctor.sectionHeaderTopPadding = ConstantHandle.tblDoctorSectionHeaderTopPadding
        
        //Number of page controll
        addPosterPageControll.numberOfPages = scrollingImages.count
        
        //Navigation Hide
        navigationController?.isNavigationBarHidden = true
        
        //PageControl dot size reduce
        for dot in addPosterPageControll.subviews{
            dot.transform = CGAffineTransform.init(scaleX: ConstantHandle.pageControlAffineScaleX, y: ConstantHandle.pagecontrolAffineScaleY)
        }
    }
}

//MARK: Extension of Actions
extension SearchVc {
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

//MARK: Extensions for TimerHandle and configureSectionHeader
extension SearchVc {

    func startTimer() {
        timer = Timer.scheduledTimer(timeInterval: ConstantHandle.posterScrollTimeInteval, target: self, selector: #selector(timerAction), userInfo: nil, repeats: true)
    }
    
    @objc func timerAction() {
        currentIndex = currentIndex < ConstantHandle.currentIndexForScrollingImageCount ? currentIndex + 1 : .zero
        addPosterPageControll.currentPage = currentIndex
        collectionForAddPoster.scrollToItem(at: IndexPath(item: currentIndex, section: .zero), at: .centeredHorizontally, animated: true)
    }
    
    func configureSectionHeader(_ sectionHeader: UIView) {
        let sectionTitle = UILabel(frame: CGRect(x: ConstantHandle.sectionTitleXPosition, y: ConstantHandle.sectionTitleYPosition, width: view.frame.size.width / ConstantHandle.sectionTitleWidthDevider, height: ConstantHandle.sectionTitleHeight))
        sectionTitle.font = UIFont.systemFont(ofSize: ConstantHandle.sectionTitleFontSize, weight: .bold)
        let btnSeeAll = UIButton(frame: CGRect(x: view.frame.size.width - ConstantHandle.btnSeeAllXPosition, y: ConstantHandle.btnSeeAllYPosition, width: ConstantHandle.btnSeeAllWidth, height: ConstantHandle.btnSeeAllHeight))
        btnSeeAll.setTitle("See All ", for: .normal)
        btnSeeAll.setTitleColor( .systemBlue, for: .normal)
        btnSeeAll.titleLabel?.font = UIFont.systemFont(ofSize: ConstantHandle.btnSeeAllFontSize, weight: .regular)
        sectionTitle.text = "Recomondation Doctor"
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
        let sectionHeader = UIView(frame: CGRect(x: ConstantHandle.sectionHeaderViewXPosition, y: ConstantHandle.sectionHeaderViewYPosition, width: view.frame.size.width, height: ConstantHandle.sectionHeaderViewHeight))
        configureSectionHeader(sectionHeader)
        return sectionHeader
    }
}

//MARK: ColleCtionView DataSource
extension SearchVc: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView {
        case collectionForAddPoster:
            return scrollingImages.count
        case collectionForSpecializationOfDr:
            return collectionDetail.count
        default:
            debugPrint("Wrong tag")
            return .zero
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch collectionView {
        case collectionForAddPoster:
            guard let scrollingCell = collectionForAddPoster.dequeueReusableCell(withReuseIdentifier: ScrollImageCell.imgCellIdentifier, for: indexPath) as? ScrollImageCell else { return UICollectionViewCell() }
            scrollingCell.imgScrolling.image = UIImage(named: scrollingImages[indexPath.row])
            return scrollingCell
        case collectionForSpecializationOfDr:
            guard let collectionCell = collectionForSpecializationOfDr.dequeueReusableCell(withReuseIdentifier: DoctorCollectionCell.collectionIdentifier, for: indexPath) as? DoctorCollectionCell else { return UICollectionViewCell() }
            collectionCell.configure(detail: collectionDetail[indexPath.row])
            return collectionCell
        default:
            debugPrint("Wrong cell")
        }
        return UICollectionViewCell()
    }
}

//MARK: CollectionViewFlowLayoutDelegate
extension SearchVc: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        switch collectionView {
        case collectionForAddPoster:
            return CGSize(width: self.view.frame.width , height: collectionView.frame.height)
        case collectionForSpecializationOfDr:
            return CGSize(width: self.view.frame.size.width / ConstantHandle.sizeForItemAtWidthDeviderForspecializationDr - 15, height: collectionView.frame.size.height)
        default:
            debugPrint("Wrong Size")
            return CGSize()
            
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        switch collectionView {
        case collectionForAddPoster:
            return ConstantHandle.minimumInterItemSpacingforCollectionForAddPoster
        case collectionForSpecializationOfDr:
            return ConstantHandle.minimumInterItemSpacingforCollectionForSpecializationDr
        default:
            debugPrint("Wrong Size")
            return .zero
        }
    }
}
