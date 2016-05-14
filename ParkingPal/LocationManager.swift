//
//  LocationManager.swift
//  ParkingPal
//
//  Created by Yoli Meydan on 5/13/16.
//  Copyright © 2016 AtomHacks. All rights reserved.
//

import Foundation
import CoreLocation
import GoogleMaps

//Get current location by referencing UserLocation.currentLocation in any class

class LocationManager: NSObject, CLLocationManagerDelegate {
    
    var locationManager = CLLocationManager()
    
    var currentLocation:CLLocationCoordinate2D?
    var locationAddress:[String]?
    
    class var manager: LocationManager {
        return UserLocation
    }
    
    override init () {
        super.init()
       
        self.locationManager.delegate = self
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest
        self.locationManager.requestWhenInUseAuthorization()
        self.locationManager.startUpdatingLocation()
    }

    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        locationManager.stopUpdatingLocation()
        
        if let location = locations.first {
            self.currentLocation = manager.location!.coordinate
        }
        
        var placemark: CLPlacemark!
        locationManager.stopUpdatingLocation()
        
        GMSGeocoder().reverseGeocodeCoordinate(manager.location!.coordinate) { (response, error) in
            print(response?.firstResult())
        }
//        CLGeocoder().reverseGeocodeLocation(manager.location!, completionHandler: {(placemarks, error)->Void in
//            if error == nil && placemarks!.count > 0 {
//                placemark = placemarks![0] as CLPlacemark
//                
//                var addressString : String = ""
//                if placemark.ISOcountryCode == "TW" /*Address Format in Chinese*/ {
//                    if placemark.country != nil {
//                        addressString = placemark.country!
//                    }
//                    if placemark.subAdministrativeArea != nil {
//                        addressString = addressString + placemark.subAdministrativeArea! + "\n"
//                    }
//                    if placemark.postalCode != nil {
//                        addressString = addressString + placemark.postalCode! + " "
//                    }
//                    if placemark.locality != nil {
//                        addressString = addressString + placemark.locality!
//                    }
//                    if placemark.thoroughfare != nil {
//                        addressString = addressString + placemark.thoroughfare!
//                    }
//                    if placemark.subThoroughfare != nil {
//                        addressString = addressString + placemark.subThoroughfare!
//                    }
//                } else {
//                    if placemark.subThoroughfare != nil {
//                        addressString = placemark.subThoroughfare! + " "
//                    }
//                    if placemark.thoroughfare != nil {
//                        addressString = addressString + placemark.thoroughfare! + "\n"
//                    }
//                    if placemark.postalCode != nil {
//                        addressString = addressString + placemark.postalCode! + " "
//                    }
//                    if placemark.locality != nil {
//                        addressString = addressString + placemark.locality! + "\n"
//                    }
//                    if placemark.administrativeArea != nil {
//                        addressString = addressString + placemark.administrativeArea! + " "
//                    }
//                    if placemark.country != nil {
//                        addressString = addressString + placemark.country!
//                    }
//                }
//                self.locationAddress = addressString
//            }
//        })
    }

}

let UserLocation = LocationManager()