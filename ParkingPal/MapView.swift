//  ViewController.swift
//  ParkingPal
//
//  Created by Oran Luzon on 5/13/16.
//  Copyright © 2016 AtomHacks. All rights reserved.
//

import UIKit
import CoreLocation
import GoogleMaps
import FlatUIKit

class MapView: UIViewController, GMSMapViewDelegate,  FUIAlertViewDelegate {
    
    var mapView: GMSMapView!
    var alertViews: [String: FUIAlertView]! = [:]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let startingLocation = UserLocation.currentLocation
        
        let camera = GMSCameraPosition.cameraWithLatitude(startingLocation!.latitude ,longitude: startingLocation!.longitude, zoom: 15)
        mapView = GMSMapView.mapWithFrame(CGRectZero, camera: camera)
        mapView.mapType = kGMSTypeNormal
        
        mapView.myLocationEnabled = true
        mapView.delegate = self
        
        
        
        
        //the recieveed location
        //fetch frm parse
        
        //var location: CLLocationCoordinate2D//get it
        
        
        
<<<<<<< HEAD
        //marker.position = CLLocationCoordinate2DMake(location)
        //marker.appearAnimation = kGMSMarkerAnimationPop
        
        
        DBManager.getAllUserNames { (people) in
            for user in people{
                print(user)
                DBManager.getUser(user, completion: { (result) in
                    print("put marker down for \(user)")
                    let marker = GMSMarker()
                    marker.position = result.location
                    marker.snippet = user
                    marker.tappable = true
                    marker.appearAnimation = kGMSMarkerAnimationPop
                    marker.map = self.mapView
                    
                    let alertView = FUIAlertView()
                    alertView.delegate = self
                    
                    alertView.title = "\(result.location)"
                    
                    alertView.titleLabel.textColor = UIColor.cloudsColor()
                    alertView.titleLabel.font = UIFont.boldFlatFontOfSize(16)
                    
                    alertView.messageLabel.text = "Name: \(user) \nPrice:\(result.price)\nTime: \(result.time)"
                    alertView.messageLabel.font = UIFont.flatFontOfSize(14)
                    alertView.messageLabel.textColor = UIColor.cloudsColor()
                    
                    alertView.backgroundOverlay.backgroundColor = UIColor.cloudsColor().colorWithAlphaComponent(0.8)
                    alertView.alertContainer.backgroundColor = UIColor.midnightBlueColor()
                    alertView.defaultButtonColor = UIColor.cloudsColor()
                    alertView.defaultButtonShadowColor = UIColor.asbestosColor()
                    alertView.defaultButtonFont = UIFont.boldFlatFontOfSize(16)//[UIFont boldFlatFontOfSize:16];
                    alertView.defaultButtonTitleColor = UIColor.asbestosColor();
                    
                    alertView.addButtonWithTitle("Accept")
                    
                    alertView.addButtonWithTitle("Cancel")
                    alertView.cancelButtonIndex = 1
                    //alertView.show()
                    
//                    popover = [[UIPopoverController alloc] initWithContentViewController:nc];
//                    [popover configureFlatPopoverWithBackgroundColor: [UIColor midnightBlueColor] cornerRadius:3];
//                    popover.delegate = self;
//                    [popover presentPopoverFromRect:button.frame inView:self.view permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];
                    
//                    let popover = UIPopoverController(contentViewController: self)
//                    popover.configureFlatPopoverWithBackgroundColor(UIColor.midnightBlueColor(), cornerRadius: 3)
//                    popover.delegate = self
//                    popover.presentPopoverFr, inView: <#T##UIView#>, permittedArrowDirections: <#T##UIPopoverArrowDirection#>, animated: <#T##Bool#>
                     self.alertViews[user] = alertView
                })
            }
        }
        
=======
>>>>>>> ea5709346055feeb507ac34c52b6620eb8838ad3
        // For later
        //marker.icon = UIImage(named: "flag_icon")
        
        //marker.map = mapView
        
        self.view = mapView
    }
    
    func mapView(mapView: GMSMapView, didTapMarker marker: GMSMarker) -> Bool {
        alertViews[marker.snippet!]!.show()
        return false
    }
    
    func alertView(alertView: FUIAlertView!, clickedButtonAtIndex buttonIndex: Int) {
        if (buttonIndex == 0){
            
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}