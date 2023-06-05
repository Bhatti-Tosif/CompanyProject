//
//  CLLocationVc.swift
//  CompanyProject
//
//  Created by Tosif Bhatti on 03/04/23.
//

import UIKit
import CoreLocation

class CLLocationVc: UIViewController {

    //MARK: Outlets
    @IBOutlet weak var longitude: UILabel!
    @IBOutlet weak var latitude: UILabel!
    
    //MARK: Variable Declaration
    let locationMAnager = CLLocationManager()
    
    //MARK: LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

}

//MARK: Extension for Actions
extension CLLocationVc {
    
    //MARK: Actions
    @IBAction func getLocation(_ sender: Any) {
        getCLLocation()
    }
    
    func getCLLocation() {
            locationMAnager.desiredAccuracy = kCLLocationAccuracyBest
            //locationMAnager.requestAlwaysAuthorization()
            locationMAnager.startUpdatingLocation()
            locationMAnager.delegate = self
    }

}

//MARK: Extension for CLLocationManagerDelegate
extension CLLocationVc: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        //let cordinate = manager.location?.coordinate
        guard let location = locations.last else {
            return
        }
        longitude.text = String(location.coordinate.longitude)
        latitude.text = String(location.coordinate.latitude)
    }
    
}
