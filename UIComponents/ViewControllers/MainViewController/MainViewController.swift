//
//  MainViewController.swift
//  CompanyProject
//
//  Created by Tosif Bhatti on 29/03/23.
//

import UIKit

class MainViewController: UIViewController {
    
    //MARK: Outlets
    @IBOutlet private weak var allButtontable: UITableView!
    
    //MARK: LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()

        //MARK: InitialSetUpCall
        initialSetUp()
    }

}
 
//MARK: Extension for initialSetUp
extension MainViewController {
    
    func initialSetUp() {
        allButtontable.dataSource = self
        allButtontable.delegate = self
        navigationAppearance()
        navigationController?.navigationBar.tintColor = .link
    }
    
    func navigationAppearance() {
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = UIColor(named: "deepAqua")
        navigationItem.title = "Components"
        appearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        navigationItem.standardAppearance = appearance
    }

}

//MARK: Extension for UITableViewDataSource
extension MainViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allComponent.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = allButtontable.dequeueReusableCell(withIdentifier: "mainTableCell") as? MainViewCellTableViewCell else {
            return UITableViewCell()
        }
        cell.configure(detail: allComponent[indexPath.row].button)
        return cell
    }
}

//MARK: Extension for UITableViewDelegate
extension MainViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let ComponentStoryBoard: UIStoryboard = UIStoryboard(name: "Label", bundle: nil)
        let ContollerStroryBoard: UIStoryboard = UIStoryboard(name: "Controller", bundle: nil)
        let TabBarStoryBoard: UIStoryboard = UIStoryboard(name: "TabBarStoryBoard", bundle: nil)
        let MapViewStoryBoard: UIStoryboard = UIStoryboard(name: "MapView", bundle: nil)
        
        switch  allComponent[indexPath.row].button {
        case "UILabel":
            guard let vc = ComponentStoryBoard.instantiateViewController(withIdentifier: allComponent[indexPath.row].viewController) as? LabelVc else { return }
            navigationController?.pushViewController(vc, animated: true)
        case "UITextView":
            guard let vc = ComponentStoryBoard.instantiateViewController(withIdentifier: allComponent[indexPath.row].viewController) as? TextViewVc else { return }
            navigationController?.pushViewController(vc, animated: true)
        case "UITextField":
            guard let vc = ComponentStoryBoard.instantiateViewController(withIdentifier: allComponent[indexPath.row].viewController) as? TextFieldVc else { return }
            navigationController?.pushViewController(vc, animated: true)
        case "UIButtons":
            guard let vc = ComponentStoryBoard.instantiateViewController(withIdentifier: allComponent[indexPath.row].viewController) as? ButtonVc else { return }
            navigationController?.pushViewController(vc, animated: true)
        case "UISlider":
            guard let vc = ComponentStoryBoard.instantiateViewController(withIdentifier: allComponent[indexPath.row].viewController) as? SliderVc else { return }
            navigationController?.pushViewController(vc, animated: true)
        case "UISwitch":
            guard let vc = ComponentStoryBoard.instantiateViewController(withIdentifier: allComponent[indexPath.row].viewController) as? SwitchVc else { return }
            navigationController?.pushViewController(vc, animated: true)
        case "UIStapper":
            guard let vc = ComponentStoryBoard.instantiateViewController(withIdentifier: allComponent[indexPath.row].viewController) as? StapperVc else { return }
            navigationController?.pushViewController(vc, animated: true)
        case "UISegmentControl":
            guard let vc = ComponentStoryBoard.instantiateViewController(withIdentifier: allComponent[indexPath.row].viewController) as? SegmentVc else { return }
            navigationController?.pushViewController(vc, animated: true)
        case "UIPageControl":
            guard let vc = ComponentStoryBoard.instantiateViewController(withIdentifier: allComponent[indexPath.row].viewController) as? SegmentVc else { return }
            navigationController?.pushViewController(vc, animated: true)
        case "UIImageView":
            guard let vc = ComponentStoryBoard.instantiateViewController(withIdentifier: allComponent[indexPath.row].viewController) as? ImageViewVc else { return }
            navigationController?.pushViewController(vc, animated: true)
        case "UIActivityIndicater":
            guard let vc = ComponentStoryBoard.instantiateViewController(withIdentifier: allComponent[indexPath.row].viewController) as? ActivityIndicaterVc else { return }
            navigationController?.pushViewController(vc, animated: true)
        case "Pull to Refresh":
            guard let vc = ComponentStoryBoard.instantiateViewController(withIdentifier: allComponent[indexPath.row].viewController) as? PullToRefreshVC else { return }
            navigationController?.pushViewController(vc, animated: true)
        case "ImagePicker":
            guard let vc = ContollerStroryBoard.instantiateViewController(withIdentifier: allComponent[indexPath.row].viewController) as? ImagePickerVc else { return }
            navigationController?.pushViewController(vc, animated: true)
        case "WKWebView":
            guard let vc = ContollerStroryBoard.instantiateViewController(withIdentifier: allComponent[indexPath.row].viewController) as? WebViewVc else { return }
            navigationController?.pushViewController(vc, animated: true)
        case "UIScrollView":
            guard let vc = ContollerStroryBoard.instantiateViewController(withIdentifier: allComponent[indexPath.row].viewController) as? ScrollViewVc else { return }
            navigationController?.pushViewController(vc, animated: true)
        case "UISearchBar":
            guard let vc = ContollerStroryBoard.instantiateViewController(withIdentifier: allComponent[indexPath.row].viewController) as? SearchBarVc else { return }
            navigationController?.pushViewController(vc, animated: true)
        case "UITabBar":
            guard let vc = TabBarStoryBoard.instantiateViewController(withIdentifier: allComponent[indexPath.row].viewController) as? TabBarControllerVc else { return }
            navigationController?.pushViewController(vc, animated: true)
        case "UIToolBar":
            guard let vc = ContollerStroryBoard.instantiateViewController(withIdentifier: allComponent[indexPath.row].viewController) as? ToolBarVc else { return }
            navigationController?.pushViewController(vc, animated: true)
        case "UIPickerView":
            guard let vc = ContollerStroryBoard.instantiateViewController(withIdentifier: allComponent[indexPath.row].viewController) as? PickerViewVc else { return }
            navigationController?.pushViewController(vc, animated: true)
        case "UIDatePicker":
            guard let vc = ContollerStroryBoard.instantiateViewController(withIdentifier: allComponent[indexPath.row].viewController) as? DatePickerVc else { return }
            navigationController?.pushViewController(vc, animated: true)
        case "UICLLocation":
            guard let vc = MapViewStoryBoard.instantiateViewController(withIdentifier: allComponent[indexPath.row].viewController) as? CLLocationVc else { return }
            navigationController?.pushViewController(vc, animated: true)
        case "UIMapView":
            guard let vc = MapViewStoryBoard.instantiateViewController(withIdentifier: allComponent[indexPath.row].viewController) as? MapViewVc else
            { return }
            navigationController?.pushViewController(vc, animated: true)
        case "UICollectionView":
            guard let vc = ContollerStroryBoard.instantiateViewController(withIdentifier: allComponent[indexPath.row].viewController) as? CollectionViewVc else { return }
            navigationController?.pushViewController(vc, animated: true)
        default :
            print("Wrong Vc")
            
        }
        allButtontable.deselectRow(at: indexPath, animated: true)
    }
}
