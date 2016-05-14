//
//  AppDelegate.swift
//  ParkingPal
//
//  Created by Yoli Meydan on 5/13/16.
//  Copyright © 2016 AtomHacks. All rights reserved.
//

import UIKit
import Parse
import GoogleMaps

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        
        //Setup Parse
        Parse.enableLocalDatastore()
        Parse.setApplicationId("o3bRoOmKK99gRMW3niQOV3SG39pl8y4XFwP4t77J", clientKey: "xeW88DhJFjBBokqetSZoiFnnfiBsF5ZtvQCQZoHQ")
        
        //Setup GoogleMaps
        GMSServices.provideAPIKey("AIzaSyBnWhhhx44mnxupbWoZDEp3ywkzxy4I3ck")
        
        return true
    }

}

