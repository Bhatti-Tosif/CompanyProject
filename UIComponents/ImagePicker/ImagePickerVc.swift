//
//  ImagePickerVc.swift
//  CompanyProject
//
//  Created by Tosif Bhatti on 31/03/23.
//

import UIKit

class ImagePickerVc: UIViewController, UINavigationControllerDelegate {

    //MARK: Outlets
    @IBOutlet private weak var imageViewOutlet: UIImageView!
    
    //MARK: LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }

}

//MARK: Extension for Actions
extension ImagePickerVc {
    
    @IBAction func selectImage(_ sender: Any) {
        let pickerVc = UIImagePickerController()
        pickerVc.sourceType = .photoLibrary
        pickerVc.delegate = self
        pickerVc.allowsEditing = true
        present(pickerVc, animated: true)
    }
    
}

//MARK: Extension for UIImagePickerControllerDelegate
extension ImagePickerVc: UIImagePickerControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true, completion: nil)
        guard let image = info[.editedImage] as? UIImage else { return }
        imageViewOutlet.image = image
    }
    
}
