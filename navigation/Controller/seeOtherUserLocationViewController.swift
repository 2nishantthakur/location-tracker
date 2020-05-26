//
//  seeOtherUserLocationViewController.swift
//  navigation
//
//  Created by Nishant Thakur on 26/05/20.
//  Copyright © 2020 Nishant Thakur. All rights reserved.
//

import UIKit
import MapKit
import Firebase

class seeOtherUserLocationViewController: UIViewController {
    let db = Firestore.firestore()
    var email = String()
    @IBOutlet var otherUserLocationMap: MKMapView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadUserLocation(email: email)
        // Do any additional setup after loading the view.
    }
    func loadUserLocation(email: String){
        let annotation = MKPointAnnotation()
        db.collection("users").document(email).addSnapshotListener { (document, error) in
            if error != nil{
                print(error)
            }else{
//                print(email)
                
                if let document = document , document.exists {
                    let dataDescription = document.data()
                    
                    self.otherUserLocationMap.removeAnnotations(self.otherUserLocationMap.annotations)
                    if dataDescription!["lat"] != nil{
                        let center = CLLocationCoordinate2D(latitude: dataDescription!["lat"] as! CLLocationDegrees, longitude: dataDescription!["long"] as! CLLocationDegrees)
                         let region = MKCoordinateRegion(center: center, span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
                         self.otherUserLocationMap.setRegion(region, animated: true)
                         annotation.coordinate = region.center
                         annotation.title = email
                         self.otherUserLocationMap.addAnnotation(annotation)
                        
                    }else{
                        print("Location Not Found!")
                    }
                     
                } else {
                    print("Document does not exist")
                }
            }
            
        }
    }
}

/*
 // MARK: - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
 // Get the new view controller using segue.destination.
 // Pass the selected object to the new view controller.
 }
 */


