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
import Parse
import Bolts

class MapView: UIViewController, GMSMapViewDelegate,  FUIAlertViewDelegate {
    
    var mapView: GMSMapView!
    var alertViews: [String: FUIAlertView]! = [:]
    var markerClicked: GMSMarker!
    var timer: NSTimer!
    var loader = UIActivityIndicatorView!()
    var price: Int!
    var acceptedAlertView = FUIAlertView!()
    
    var methodRun = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("Loaded")
        
        let startingLocation = UserLocation.currentLocation
        
        let camera = GMSCameraPosition.cameraWithLatitude(startingLocation!.latitude ,longitude: startingLocation!.longitude, zoom: 15)
        mapView = GMSMapView.mapWithFrame(CGRectZero, camera: camera)
        mapView.mapType = kGMSTypeNormal
        
        mapView.myLocationEnabled = true
        mapView.delegate = self
        
        
        acceptedAlertView = FUIAlertView()
        acceptedAlertView.tag = 1
        acceptedAlertView.delegate = self
        
        acceptedAlertView.title = ""
        
        acceptedAlertView.titleLabel.textColor = UIColor.cloudsColor()
        acceptedAlertView.titleLabel.font = UIFont.boldFlatFontOfSize(20)
        
        acceptedAlertView.messageLabel.text = ""
        acceptedAlertView.messageLabel.font = UIFont.flatFontOfSize(14)
        acceptedAlertView.messageLabel.textColor = UIColor.cloudsColor()
        
        acceptedAlertView.backgroundOverlay.backgroundColor = UIColor.cloudsColor().colorWithAlphaComponent(0.8)
        acceptedAlertView.alertContainer.backgroundColor = UIColor.midnightBlueColor()
        acceptedAlertView.defaultButtonColor = FlatBlue()
        acceptedAlertView.defaultButtonShadowColor = FlatBlueDark()
        acceptedAlertView.defaultButtonFont = UIFont.boldFlatFontOfSize(16)//[UIFont boldFlatFontOfSize:16];
        acceptedAlertView.defaultButtonTitleColor = UIColor.whiteColor()
        
        acceptedAlertView.cancelButtonIndex = 0

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
                    alertView.tag = 0
                    
                    alertView.title = "\(UserLocation.locationAddress!)"
                    
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
        
        addNavbar()
        addPointsLabel()
        addBackButton()
    }
    
    func mapView(mapView: GMSMapView, didTapMarker marker: GMSMarker) -> Bool {
        markerClicked = marker
        alertViews[marker.snippet!]!.show()
        
        return false
    }
    
    func alertView(alertView: FUIAlertView!, clickedButtonAtIndex buttonIndex: Int) {
        print(buttonIndex)
        DBManager.getUser(self.markerClicked.snippet!) { (result) in
            self.price = result.price
            print(NSUserDefaults().integerForKey("points"))
        }
        if(alertView.tag == 0 && buttonIndex == 0) {
            DBManager.addAcceptedRequest(DBManager.yourName, theirName: markerClicked.snippet!, location: markerClicked.position)
            //checkIfAccepted()
            //let timer = NSTimer(timeInterval: 0.25, target: self, selector: "checkIfAccepted", userInfo: nil, repeats: true)
            timer = NSTimer.scheduledTimerWithTimeInterval(0.5, target: self, selector: Selector("checkIfAccepted"), userInfo: nil, repeats: true)
            timer.fire()
            //helloWorldTimer.fire()
            
            
            loader = UIActivityIndicatorView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width/4, height: self.view.frame.height/10))
            loader.sizeToFit()
            loader.center = CGPoint(x: self.view.frame.width/2, y: self.view.frame.height/4)
            loader.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.WhiteLarge
            loader.color = FlatWatermelon()
            //loader.startAnimating()
            
            //self.view.addSubview(loader)
            
            
        }else if(alertView.tag == 1) {
            print("Removed")
//            MapManager().directionsUsingGoogle(from: UserLocation.currentLocation!, to: markerClicked.position, directionCompletionHandler: { (route, directionInformation, boundingRegion, error) in
//                if(error != nil){
//                        print(error)
//                }else{
//                    let layer = route
//                    self.mapView.
//                    if let web = self.mapView?{
//                        
//                        dispatch_async(dispatch_get_main_queue()) {
//                            web.a(route!)
//                            web.setVisibleMapRect(boundingRegion!, animated: true)
//                        }
//                        
//                    }
//                    
//                }
//            })
            //DBManager.removeUser(self.markerClicked.snippet!)
            //DBManager.removeRequest(self.markerClicked.snippet!)
        }
        
    }
    
    func checkIfAccepted(){
        //print("runing")
        let pfQuery = PFQuery(className: "AcceptedRequests")
        pfQuery.whereKey("Parker", equalTo: markerClicked.snippet! as AnyObject)
        
        pfQuery.findObjectsInBackgroundWithBlock {
            (objects:[PFObject]?, error:NSError?) -> Void in
            if error == nil {
                for object in objects!{
                    //print("\t\t\(object.objectForKey("Accepted") as? Bool)")
                    if(object.objectForKey("Accepted") as? Bool == nil) {
                        //self.checkIfAccepted()
                        //return
                    }else if((object.objectForKey("Accepted") as! Bool) == true) {
                        print("Hello")
                        self.acceptedAlertView.title = "ACCEPTED"
                        self.acceptedAlertView.messageLabel.text = "Your parking spot is waiting for you"
                        self.acceptedAlertView.addButtonWithTitle("Drive")
                        if(self.acceptedAlertView.buttons.count > 1){
                            for _ in 0..<self.acceptedAlertView.buttons.count - 1
                            {
                                self.acceptedAlertView.buttons.removeLastObject()
                            }
                        }
                        
                        self.acceptedAlertView.show()
                        
                        self.loader.removeFromSuperview()
                        self.timer.invalidate()
                        
                        self.runOnce()
                        
                        print(NSUserDefaults().integerForKey("points"))
                    }else if ((object.objectForKey("Accepted") as! Bool) == false) {
                        print("Declined")
                        self.acceptedAlertView.title = "DECLINED"
                        self.acceptedAlertView.messageLabel.text = "Better luck next time"
                        self.acceptedAlertView.addButtonWithTitle("Back")
                        self.acceptedAlertView.show()
                        
                        self.loader.removeFromSuperview()
                        self.timer.invalidate()
                    }
                }
                //print("Checking")
                
                
//                if(objects![0].objectForKey("Accepted") as? Bool == nil) {
//                    //self.checkIfAccepted()
//                    return
//                }else if((objects![0].objectForKey("Accepted") as! Bool) == true) {
//                    print("Hello")
//                    self.acceptedAlertView.title = "ACCEPTED"
//                    self.acceptedAlertView.messageLabel.text = "Your parking spot is waiting for you"
//                    self.acceptedAlertView.addButtonWithTitle("Drive")
//                    self.acceptedAlertView.show()
//                    
//                    self.loader.removeFromSuperview()
//                    
//                }else if ((objects![0].objectForKey("Accepted") as! Bool) == false) {
//                    print("Declined")
//                    self.acceptedAlertView.title = "DECLINED"
//                    self.acceptedAlertView.messageLabel.text = "Better luck next time"
//                    self.acceptedAlertView.addButtonWithTitle("Back")
//                    self.acceptedAlertView.show()
//                    
//                    self.loader.removeFromSuperview()
//                }
                //print("WHAT")

            } else {
                print("Not here")
                // Log details of the failure
                print("Error: \(error!) \(error!.userInfo)")
            }
        }
    }
    
    func runOnce(){
        if (!methodRun){
            NSUserDefaults().setInteger(NSUserDefaults().integerForKey("points") - price, forKey: "points")
            DBManager.removeUser(markerClicked.snippet!)
            DBManager.removeRequest(markerClicked.snippet!)
            methodRun = true
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
    
}