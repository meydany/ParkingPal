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
import ChameleonFramework
class MapView: UIViewController, GMSMapViewDelegate,  FUIAlertViewDelegate {
    
    var mapView: GMSMapView!
    var alertViews: [String: FUIAlertView]! = [:]
    var markerClicked: GMSMarker!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("Loaded")
        
        let startingLocation = UserLocation.currentLocation
        
        let camera = GMSCameraPosition.cameraWithLatitude(startingLocation!.latitude ,longitude: startingLocation!.longitude, zoom: 15)
        mapView = GMSMapView.mapWithFrame(CGRectZero, camera: camera)
        mapView.mapType = kGMSTypeNormal
        
        mapView.myLocationEnabled = true
        mapView.delegate = self
        
        
        
        
        //the recieveed location
        //fetch frm parse
        
        //var location: CLLocationCoordinate2D//get it
        
        
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
                    
                    alertView.title = "\(UserLocation.locationAddress![0]), \(UserLocation.locationAddress![1])"
                    
                    alertView.titleLabel.textColor = UIColor.cloudsColor()
                    alertView.titleLabel.font = UIFont.boldFlatFontOfSize(16)
                    
                    alertView.messageLabel.text = "Name: \(user) \nPrice:\(result.price)\nTime: \(result.time)"
                    alertView.messageLabel.font = UIFont.flatFontOfSize(14)
                    alertView.messageLabel.textColor = UIColor.cloudsColor()
                    
                    alertView.backgroundOverlay.backgroundColor = UIColor.cloudsColor().colorWithAlphaComponent(0.8)
                    alertView.alertContainer.backgroundColor = UIColor.midnightBlueColor()
                    alertView.defaultButtonColor = FlatBlue()
                    alertView.defaultButtonShadowColor = FlatBlueDark()
                    alertView.defaultButtonFont = UIFont.boldFlatFontOfSize(16)//[UIFont boldFlatFontOfSize:16];
                    alertView.defaultButtonTitleColor = UIColor.whiteColor()
                    
                    alertView.addButtonWithTitle("Request")
                
                    alertView.addButtonWithTitle("Cancel")
                    alertView.cancelButtonIndex = 1
                    
                    //alertView.buttons[0].backgroundColor = FlatBlue()
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
        
        // For later
        //marker.icon = UIImage(named: "flag_icon")
        
        //marker.map = mapView
        
        self.view = mapView
    }
    
    func mapView(mapView: GMSMapView, didTapMarker marker: GMSMarker) -> Bool {
        markerClicked = marker
        alertViews[marker.snippet!]!.show()
        
        return false
    }
    
    func alertView(alertView: FUIAlertView!, clickedButtonAtIndex buttonIndex: Int) {
        if (buttonIndex == 0){
            print("requested")
            DBManager.addAcceptedRequest(DBManager.yourName, theirName: markerClicked.snippet!, location: markerClicked.position)
            
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}