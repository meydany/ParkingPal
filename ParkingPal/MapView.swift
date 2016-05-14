//  ViewController.swift
//  ParkingPal
//
//  Created by Oran Luzon on 5/13/16.
//  Copyright © 2016 AtomHacks. All rights reserved.
//

import UIKit
import CoreLocation
import GoogleMaps

class MapView: UIViewController, CLLocationManagerDelegate {
    
    let locationManager = CLLocationManager()
    var mapView: GMSMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        // Ask for Authorisation from the User.
        self.locationManager.requestAlwaysAuthorization()
        
        // For use in foreground
        self.locationManager.requestWhenInUseAuthorization()
        
        
        
        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
            locationManager.startUpdatingLocation()
        }
        
        let startingLocation = locationManager.location!.coordinate
        
        let camera = GMSCameraPosition.cameraWithLatitude(startingLocation.latitude ,longitude: startingLocation.longitude, zoom: 15)
        mapView = GMSMapView.mapWithFrame(CGRectZero, camera: camera)
        mapView.mapType = kGMSTypeNormal
        
        mapView.myLocationEnabled = true
        
        
        self.view = mapView
        
        let marker = GMSMarker()
        
        //the recieveed location
        //fetch frm parse
        
        marker.position = CLLocationCoordinate2DMake(40.9111579740801 , -73.8994963188413)
        marker.appearAnimation = kGMSMarkerAnimationPop
        
        // For later
        //marker.icon = UIImage(named: "flag_icon")
        
        marker.map = mapView
        
        
    }
    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let locValue:CLLocationCoordinate2D = manager.location!.coordinate
        //mapView.animateToLocation(locValue)
        //print("locations = \(locValue.latitude) \(locValue.longitude)")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}