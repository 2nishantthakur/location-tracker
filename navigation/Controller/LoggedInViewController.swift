//
//  LoggedInViewController.swift
//  navigation
//
//  Created by Nishant Thakur on 24/05/20.
//  Copyright © 2020 Nishant Thakur. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation
import Firebase

class LoggedInViewController: UIViewController, CLLocationManagerDelegate, MKMapViewDelegate{
    let db = Firestore.firestore()
    let locationManager = CLLocationManager()
    @IBOutlet var map: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        
        
        map.delegate = self
        

        // Do any additional setup after loading the view.
    }
    @IBAction func updateLocation(_ sender: Any) {
        //locationManager.requestLocation()
        locationManager.startUpdatingLocation()
        print("update pressed")
        var currentLocation: CLLocation!

        if
           CLLocationManager.authorizationStatus() == .authorizedWhenInUse ||
           CLLocationManager.authorizationStatus() ==  .authorizedAlways
        {
            print("Got Location")
            
            locationManager.requestLocation()
            DispatchQueue.main.async {
                
                currentLocation = self.locationManager.location
                print(currentLocation)
            }
//            currentLocation = locationManager.location
//            print(currentLocation)
            //map.userLocation.location = currentLocation
        }
    }
    @IBAction func seeOthersLocation(_ sender: Any) {
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
