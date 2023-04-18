//
//  MapViewVc.swift
//  CompanyProject
//
//  Created by Tosif Bhatti on 03/04/23.
//

import UIKit
import MapKit

class MapViewVc: UIViewController {

    //MARK: Outlets
    @IBOutlet private weak var mapView: MKMapView!
    @IBOutlet private weak var latitudeTextField: UITextField!
    @IBOutlet private weak var longitudeTextField: UITextField!
    
    //MARK: Variable Declaration
    let locationManager = CLLocationManager()
    
    //MARK: LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //MARK: InitialSetUpCall
        initialSetUp()
    }

}
//MARK: Extension for initialSetUp
extension MapViewVc {
    
    func initialSetUp() {
        locationManager.delegate = self
        mapView.delegate = self
        locationManager.requestWhenInUseAuthorization()
        //locationManager.startUpdatingLocation()
        //getMap()
    }
    
}

//MARK: Extension for Actions
extension MapViewVc {
    
    @IBAction func currentLocationTapped(_ sender: Any) {
        currentLocation()
    }
    
    @IBAction func directionClick(_ sender: Any) {
        guard let latitudeText = latitudeTextField.text else { return }
        guard let longitudeText = longitudeTextField.text else { return }
        guard let latitude = Double(latitudeText) else {
            return
        }
        guard let longitude = Double(longitudeText) else { return }
        let sourceLocation = CLLocationCoordinate2D(latitude: 23.028315984209236, longitude: 72.49938282658219)
        let destinationLocation = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        createPath(sourceLocation: sourceLocation, destinationLocation: destinationLocation)
        mapView.removeOverlays(mapView.overlays)
    }
    
}

//MARK: Extension for getMap() and all Function
extension MapViewVc {
    
    func getMap() {
        let latitude: CLLocationDegrees = 23.02845421837084
        let longitude: CLLocationDegrees = 72.49938282616895
        let latDalta: CLLocationDegrees = 0.01
        let longDalta: CLLocationDegrees = 0.01
        
        let location: CLLocationCoordinate2D = CLLocationCoordinate2DMake(latitude, longitude)
        let span: MKCoordinateSpan = MKCoordinateSpan(latitudeDelta: latDalta, longitudeDelta: longDalta)
        
        let region = MKCoordinateRegion(center: location, span: span)
        
        mapView.setRegion(region, animated: true)
        
        let annotation = MKPointAnnotation()
        annotation.coordinate = location
        annotation.title = "Simform"
        self.mapView.addAnnotation(annotation)
    }
    
    func currentLocation() {
        locationManager.startUpdatingLocation()
    }
    
    func createPath(sourceLocation: CLLocationCoordinate2D, destinationLocation: CLLocationCoordinate2D) {
        let sourcePlaceMark = MKPlacemark(coordinate: sourceLocation, addressDictionary: nil)
        let destinationPlaceMark = MKPlacemark(coordinate: destinationLocation, addressDictionary: nil)
        
        let sourceMapItem = MKMapItem(placemark: sourcePlaceMark)
        let destinationMapItem = MKMapItem(placemark: destinationPlaceMark)
        
        let sourceAnnotation = MKPointAnnotation()
        sourceAnnotation.title = "Simform"
        sourceAnnotation.subtitle = "Great Place to Work"
        if let location = sourcePlaceMark.location {
            sourceAnnotation.coordinate = location.coordinate
        }
        
        let destinationAnnotation = MKPointAnnotation()
        destinationAnnotation.title = "Destination"
        destinationAnnotation.subtitle = "My sweet home"
        if let location = destinationPlaceMark.location {
            destinationAnnotation.coordinate = location.coordinate
        }
        mapView.removeAnnotations(mapView.annotations)
        self.mapView.showAnnotations([sourceAnnotation, destinationAnnotation], animated: true)
        
        //Direction
        let directionRequest = MKDirections.Request()
        directionRequest.source = sourceMapItem
        directionRequest.destination = destinationMapItem
        directionRequest.transportType = .automobile
        
        let direction = MKDirections(request: directionRequest)
        
        direction.calculate(completionHandler: { (response, error) in
            guard let response = response else {
                if let error = error {
                    print("ERROR FOUND: \(error.localizedDescription)")
                }
                return
            }
            
            let route = response.routes[0]
            self.mapView.addOverlay(route.polyline, level: MKOverlayLevel.aboveRoads)
            
            let rect = route.polyline.boundingMapRect
            self.mapView.setRegion(MKCoordinateRegion(rect), animated: true)
            
        })
    }
}

//MARK: Extension for CLLocationManagerDelegate
extension MapViewVc: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let currentCordinate = locationManager.location?.coordinate else { return }
        let region = MKCoordinateRegion(center: currentCordinate, latitudinalMeters: 1000, longitudinalMeters: 1000)
        mapView.setRegion(region, animated: true)
        mapView.showsUserLocation = true
        locationManager.stopUpdatingLocation()
    }
}

//MARK: Extension for MKMapViewDelegate
extension MapViewVc: MKMapViewDelegate {
    
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        let rendere = MKPolylineRenderer(overlay: overlay)
        rendere.lineWidth = 5
        rendere.strokeColor = .link
        return rendere
    }
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: "custome")
        if annotationView == nil {
            annotationView = MKAnnotationView(annotation: annotation, reuseIdentifier: "custome")
            annotationView?.canShowCallout = true
        } else {
            annotationView?.annotation = annotation
        }
        
        switch annotation.title {
        case "Simform":
            annotationView?.image = UIImage(systemName: "building")
        case "Destination":
            annotationView?.image = UIImage(systemName: "house")
        default:
            print("wrong")
        }
        return annotationView
    }
}
