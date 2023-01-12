//
//  ViewController.swift
//  CompanyProject
//
//  Created by Tosif Bhatti on 11/01/23.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBOutlet weak var email:UITextField!
    
    
    @IBOutlet weak var pass: UITextField!
    
    @IBOutlet weak var resultVal: UILabel!
    
    var id:String="tosif@gmail.com"
    var code:String="tosif"
    
//    if email.text==id{
//        if pass.text==code{
//            resultVal.text="Valid User"
//        }
//    }
    
    
    @IBAction func btn(_ sender: UIButton) {
        
        if pass.text=="bhatti"{
            self.performSegue(withIdentifier: "second", sender: self)
        }
    }
}

