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
    var locationAddress:String?
    
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
            self.locationAddress = "\(response!.firstResult()!.lines![0]) \(response!.firstResult()!.lines![1])"
        }
    }

    func getAddress(location: CLLocationCoordinate2D) -> String {
        GMSGeocoder().reverseGeocodeCoordinate(location) { (response, error) in
            return "\(response!.firstResult()!.lines![0]) \(response!.firstResult()!.lines![1])"
        }
        return ""
    }
}

let UserLocation = LocationManager()