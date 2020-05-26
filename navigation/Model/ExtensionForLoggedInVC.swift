//
//  ExtensionForLoggedInVC.swift
//  navigation
//
//  Created by Nishant Thakur on 25/05/20.
//  Copyright © 2020 Nishant Thakur. All rights reserved.
//

import Foundation
import MapKit
import CoreLocation
import Firebase

extension LoggedInViewController{
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        print("")
        let annotation = MKPointAnnotation()
        if let location = locations.last{
            map.removeAnnotations(map.annotations)
            let center = CLLocationCoordinate2D(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
            let region = MKCoordinateRegion(center: center, span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
            self.map.setRegion(region, animated: true)
            
           
            
            
            annotation.coordinate = location.coordinate
            var lat = location.coordinate.latitude as? Double
            var long = location.coordinate.longitude as? Double
            let currentLocation = Location(lat: lat!, long: long!)
            
            updateLocationWithFirestore(lat: lat!, long: long!)
            
            print("\(lat),\(long)")
            annotation.title = "Me"
            annotation.subtitle = "current location"
            
            map.addAnnotation(annotation)
        }
        
    }
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        locationManager.stopUpdatingLocation()
        
        if (error) != nil {
            print(error)
         }
    }
    func updateLocationWithFirestore(lat: Double, long: Double){
        print("Firestore Called")
        
        db.collection("users").document("\(Auth.auth().currentUser?.email)").setData(["lat": lat,"long": long])
    }
}
