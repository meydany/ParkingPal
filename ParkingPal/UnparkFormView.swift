//
//  UnparkFormView.swift
//  ParkingPal
//
//  Created by Yoli Meydan on 5/14/16.
//  Copyright © 2016 AtomHacks. All rights reserved.
//

import Foundation
import UIKit
import FlatUIKit
import ChameleonFramework
import Parse
import Bolts

class UnparkFormView: UIViewController, FUIAlertViewDelegate {
    
    var headerLabel: UILabel!
    
    var nameField: FUITextField!
    var locationField: FUITextField!
    var priceField: FUITextField!
    var submitButton: FUIButton!
    
    var fieldViews: [UIView]! = []
    
    var loader: UIActivityIndicatorView!
    
    var requestObject: PFObject! =  PFObject(className: "AcceptedRequests")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.whiteColor()
        self.hideKeyboardWhenTappedAround()
        
        headerLabel = UILabel(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height/6))
        headerLabel.textAlignment = NSTextAlignment.Center
        headerLabel.center = CGPoint(x: self.view.frame.width/2, y: self.view.frame.height*0.2)
        headerLabel.text = "UN-PARK"
        headerLabel.font = UIFont(name: "Quicksand-Light", size: 70 * ScreenRatios.screenWidthRatio)
        headerLabel.textColor = FlatWatermelon()
        
        nameField = FUITextField(frame: CGRect(x: 0, y: 0, width: 3*self.view.frame.width/4, height: self.view.frame.height/10))
        nameField.center = CGPoint(x: self.view.frame.width/2, y: self.view.frame.height*0.35)
        nameField.placeholder = "Your name"
        nameField.backgroundColor = UIColor.clearColor()
        nameField.edgeInsets = UIEdgeInsetsMake(4, 15, 4, 15)
        nameField.textFieldColor = UIColor.whiteColor()
        nameField.borderColor = FlatWatermelonDark()
        nameField.borderWidth = 2
        nameField.cornerRadius = 3
        
        locationField = FUITextField(frame: CGRect(x: 0, y: 0, width: 3*self.view.frame.width/4, height: self.view.frame.height/10))
        locationField.center = CGPoint(x: self.view.frame.width/2, y: self.view.frame.height*0.5)
        locationField.text = UserLocation.locationAddress!
        locationField.backgroundColor = UIColor.whiteColor()
        locationField.edgeInsets = UIEdgeInsetsMake(4, 15, 4, 15)
        locationField.textFieldColor = UIColor.whiteColor()
        locationField.borderColor = FlatWatermelonDark()
        locationField.borderWidth = 2
        locationField.cornerRadius = 3
        
        priceField = FUITextField(frame: CGRect(x: 0, y: 0, width: 3*self.view.frame.width/4, height: self.view.frame.height/10))
        priceField.center = CGPoint(x: self.view.frame.width/2, y: self.view.frame.height*0.65)
        priceField.placeholder = "Minimum Price"
        priceField.backgroundColor = UIColor.clearColor()
        priceField.edgeInsets = UIEdgeInsetsMake(4, 15, 4, 15)
        priceField.textFieldColor = UIColor.whiteColor()
        priceField.borderColor = FlatWatermelonDark()
        priceField.borderWidth = 2
        priceField.cornerRadius = 3
        
        submitButton = FUIButton(frame: CGRect(x: 0, y: 0, width: self.view.frame.width*0.75, height: self.view.frame.height/5))
        submitButton.center = CGPoint(x: self.view.frame.width/2, y: self.view.frame.height*0.85)
        submitButton.buttonColor = FlatWatermelon()
        submitButton.shadowColor = FlatWatermelonDark()
        submitButton.shadowHeight = 4;
        submitButton.cornerRadius = 6.0;
        submitButton.setTitle("SEARCH", forState: UIControlState.Normal)
        submitButton.setTitleColor(UIColor.cloudsColor(), forState: UIControlState.Normal)
        submitButton.titleLabel!.font = UIFont(name: "Quicksand-Light", size: 50 * ScreenRatios.screenWidthRatio)
        submitButton.addTarget(self, action: "submit", forControlEvents: .TouchUpInside)
        
        loader = UIActivityIndicatorView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width/4, height: self.view.frame.height/10))
        loader.sizeToFit()
        loader.center = CGPoint(x: self.view.frame.width/2, y: self.view.frame.height/2)
        loader.alpha = 0
        loader.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.WhiteLarge
        loader.color = FlatWatermelon()
        
        fieldViews.append(nameField)
        fieldViews.append(locationField)
        fieldViews.append(priceField)
        fieldViews.append(submitButton)
        
        self.view.addSubview(headerLabel)
        self.view.addSubview(locationField)
        self.view.addSubview(priceField)
        self.view.addSubview(nameField)
        self.view.addSubview(submitButton)
        
        self.view.addSubview(loader)
        addNavbar()
        addPointsLabel()
        addBackButton()
    }
    
    func submit() {
        DBManager.addUser(nameField.text!, location: UserLocation.currentLocation!, time: 0, price: Int(priceField.text!)!)
        
        for view in fieldViews {
            UIView.animateWithDuration(0.25, animations: {
                view.alpha = 0
            }) { _ in
                view.removeFromSuperview()
            }
        }
        UIView.animateWithDuration(0.25, animations: {
            self.loader.alpha = 1
        }) { _ in
            self.loader.startAnimating()
            self.getRequest()
        }
    }
    
    func getRequest() {
        let pfQuery = PFQuery(className: "AcceptedRequests")
        pfQuery.whereKey("Parker", equalTo: nameField.text!)
        
        pfQuery.findObjectsInBackgroundWithBlock {
            (objects:[PFObject]?, error:NSError?) -> Void in
            if error == nil {
                if(objects!.count == 0) {
                    self.getRequest()
                }
                if let objects = objects {
                    for object in objects {
                        print("Got request from \(object.objectForKey("Requester")!)")
                        self.requestObject = object
                        self.gotRequest()
                    }
                }
            } else {
                print("Not here")
                // Log details of the failure
                print("Error: \(error!) \(error!.userInfo)")
            }
        }
    }
    
    func gotRequest() {
        let alertView = FUIAlertView()
        alertView.delegate = self
        
        alertView.title = "Request from \(self.requestObject.objectForKey("Requester")!)"
        
        alertView.titleLabel.textColor = UIColor.cloudsColor()
        alertView.titleLabel.font = UIFont.boldFlatFontOfSize(16)
        
        alertView.messageLabel.font = UIFont.flatFontOfSize(14)
        alertView.messageLabel.textColor = UIColor.cloudsColor()
        
        alertView.backgroundOverlay.backgroundColor = UIColor.cloudsColor().colorWithAlphaComponent(0.8)
        alertView.alertContainer.backgroundColor = UIColor.midnightBlueColor()
        alertView.defaultButtonColor = UIColor.cloudsColor()
        alertView.defaultButtonShadowColor = UIColor.asbestosColor()
        alertView.defaultButtonFont = UIFont.boldFlatFontOfSize(16)//[UIFont boldFlatFontOfSize:16];
        alertView.defaultButtonTitleColor = UIColor.asbestosColor();
        
        alertView.addButtonWithTitle("Accept")
        alertView.addButtonWithTitle("Decline")
        
        let locationCoordinate = CLLocationCoordinate2DMake((self.requestObject.objectForKey("Location") as! [String:Double])["Latitude"]!, (self.requestObject.objectForKey("Location") as! [String:Double])["Longitude"]!)
        UserLocation.getAddress(locationCoordinate) { (result) in
            //Calculate time
            let destination = CLLocation(latitude: locationCoordinate.latitude, longitude: locationCoordinate.longitude)
            
            var timeText: String
            
            let startLoc = CLLocation(latitude: UserLocation.currentLocation!.latitude, longitude: UserLocation.currentLocation!.longitude)
            
            let time = Int((((startLoc.distanceFromLocation(destination))/5) + 0.5))
            
            timeText = "\(time) seconds"
            if(time > 60){
                timeText = "\((time/60)/60) hours"
            }

            alertView.messageLabel.text = "Location: \(result) \nTime: " + timeText

            UIView.animateWithDuration(0.25, animations: {
                self.loader.alpha = 0
            }) { _ in
                self.loader.stopAnimating()
                self.loader.removeFromSuperview()
                
                NSUserDefaults().setInteger(NSUserDefaults().integerForKey("points") + Int(self.priceField.text!)!, forKey: "points")
                alertView.show()
            }
        }
    }
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
    
    func alertView(alertView: FUIAlertView!, clickedButtonAtIndex buttonIndex: Int) {
        if(buttonIndex == 0) {
            self.requestObject.setObject(true, forKey: "Accepted")
            self.presentViewController(PostAcceptanceParker(), animated: true, completion: nil)
        }else if (buttonIndex == 1) {
            self.requestObject.setObject(false, forKey: "Accepted")
        }
        self.requestObject.saveInBackground()
    }
}
