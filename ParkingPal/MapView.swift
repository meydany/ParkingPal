//  ViewController.swift
//  ParkingPal
//
//  Created by Oran Luzon on 5/13/16.
//  Copyright © 2016 AtomHacks. All rights reserved.
//

import UIKit
import CoreLocation
import GoogleMaps

class MapView: UIViewController {
    
    var mapView: GMSMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let startingLocation = UserLocation.currentLocation
        
        let camera = GMSCameraPosition.cameraWithLatitude(startingLocation!.latitude ,longitude: startingLocation!.longitude, zoom: 15)
        mapView = GMSMapView.mapWithFrame(CGRectZero, camera: camera)
        mapView.mapType = kGMSTypeNormal
        
        mapView.myLocationEnabled = true
        
        self.view = mapView
        
        let marker = GMSMarker()
        
        //the recieveed location
        //fetch frm parse
        
        var location: CLLocationCoordinate2D//get it
        
        
        // For later
        //marker.icon = UIImage(named: "flag_icon")
        
        marker.map = mapView
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}