//
//  MainViewCellTableViewCell.swift
//  CompanyProject
//
//  Created by Tosif Bhatti on 29/03/23.
//

import UIKit

struct UIComponent {
    var viewController: String
    var storyBoard: String
    var identifier: String
    var button: String
}

//MARK: Variable Declaration
let allComponent: [UIComponent] = [UIComponent(viewController: "LabelVc", storyBoard: "Label", identifier: "LabelVc", button: "UILabel"),
                                   UIComponent(viewController: "TextViewVc", storyBoard: "Label", identifier: "TextViewVc", button: "UITextView"),
                                   UIComponent(viewController: "TextFieldVc", storyBoard: "Label", identifier: "TextFieldVc", button: "UITextField"),
                                   UIComponent(viewController: "ButtonVc", storyBoard: "Label", identifier: "ButtonVc", button: "UIButtons"),
                                   UIComponent(viewController: "SliderVc", storyBoard: "Label", identifier: "SliderVc", button: "UISlider"),
                                   UIComponent(viewController: "SwitchVc", storyBoard: "Label", identifier: "SwitchVc", button: "UISwitch"),
                                   UIComponent(viewController: "StapperVc", storyBoard: "Label", identifier: "StapperVc", button: "UIStapper"),
                                   UIComponent(viewController: "SegmentVc", storyBoard: "Label", identifier: "SegmentVc", button: "UISegmentControl"),
                                   UIComponent(viewController: "SegmentVc", storyBoard: "Label", identifier: "SegmentVc", button: "UIPageControl"),
                                   UIComponent(viewController: "ImageViewVc", storyBoard: "Label", identifier: "ImageViewVc", button: "UIImageView"),
                                   UIComponent(viewController: "ActivityIndicaterVc", storyBoard: "Label", identifier: "ActivityIndicaterVc", button: "UIActivityIndicater"),
                                   UIComponent(viewController: "PullToRefreshVC", storyBoard: "Label", identifier: "PullToRefreshVC", button: "Pull to Refresh"),
                                   UIComponent(viewController: "ImagePickerVc", storyBoard: "Controller", identifier: "ImagePickerVc", button: "ImagePicker"),
                                   UIComponent(viewController: "WebViewVc", storyBoard: "Controller", identifier: "WebViewVc", button: "WKWebView"),
                                   UIComponent(viewController: "ScrollViewVc", storyBoard: "Controller", identifier: "ScrollViewVc", button: "UIScrollView"),
                                   UIComponent(viewController: "SearchBarVc", storyBoard: "Controller", identifier: "SearchBarVc", button: "UISearchBar"),
                                   UIComponent(viewController: "TabBarControllerVc", storyBoard: "Controller", identifier: "TabBarControllerVc", button: "UITabBar"),
                                   UIComponent(viewController: "ToolBarVc", storyBoard: "Controller", identifier: "ToolBarVc", button: "UIToolBar"),
                                   UIComponent(viewController: "PickerViewVc", storyBoard: "Controller", identifier: "PickerViewVc", button: "UIPickerView"),
                                   UIComponent(viewController: "DatePickerVc", storyBoard: "Controller", identifier: "DatePickerVc", button: "UIDatePicker"),
                                   UIComponent(viewController: "CLLocationVc", storyBoard: "MapView", identifier: "CLLocationVc", button: "UICLLocation"),
                                   UIComponent(viewController: "MapViewVc", storyBoard: "MapView", identifier: "MapViewVc", button: "UIMapView"),
                                   UIComponent(viewController: "CollectionViewVc", storyBoard: "Controller", identifier: "CollectionViewVc", button: "UICollectionView")]

class MainViewCellTableViewCell: UITableViewCell {

    //MARK: Outlets
    @IBOutlet private weak var componentLabel: UILabel!
    
    //MARK: LifeCycle
    override func awakeFromNib() {
        super.awakeFromNib()
   
        componentLabel.layer.cornerRadius = 10
        componentLabel.clipsToBounds = true
        componentLabel.layer.borderWidth = 1
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    //MARK: Configure Cell
    func configure(detail: String) {
        componentLabel.text = detail
    }

}
