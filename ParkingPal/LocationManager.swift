//
//  LocationManager.swift
//  ParkingPal
//
//  Created by Yoli Meydan on 5/13/16.
//  Copyright © 2016 AtomHacks. All rights reserved.
//

import Foundation
import CoreLocation

//Get current location by referencing UserLocation.currentLocation in any class

class LocationManager: NSObject, CLLocationManagerDelegate {
    
    var locationManager = CLLocationManager()
    
    var currentLocation:CLLocationCoordinate2D?
    
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
        if let location = locations.first {
            self.currentLocation = manager.location!.coordinate
        }
    }

}

let UserLocation = LocationManager()