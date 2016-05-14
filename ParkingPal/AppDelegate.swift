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
class AppDelegate: UIResponder, UIApplicationDelegate, UINavigationControllerDelegate {

    var window: UIWindow?
    var navController: UINavigationController!

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        
//        UINavigationController *navCtrlr = [[UINavigationController alloc]initWithRootViewController:self.viewController];
//        [self.window setRootViewController:navCtrlr];
//        navCtrlr.delegate = self;
//        navCtrlr.navigationBarHidden = YES;
//        let navCtlr = UINavigationController(rootViewController: (UIApplication.sharedApplication().keyWindow?.rootViewController)!)
//        
//        
//        navCtlr.delegate = self
//        navCtlr.navigationBarHidden = true
        
//        self.window = UIWindow(frame: UIScreen.mainScreen().bounds)
//        let FVC = ViewController(nibName: nil, bundle: nil)
//        self.navController = UINavigationController(rootViewController: FVC)
//        self.window?.rootViewController = self.navController
//        self.window?.backgroundColor = UIColor.clearColor()
//        self.window?.makeKeyAndVisible()
//        
//        
//        let vc = ViewController()
//        
//        self.window = UIWindow(frame: UIScreen.mainScreen().bounds)
//        navController = UINavigationController(rootViewController: vc)
//        self.window!.rootViewController = navController
//        self.window?.makeKeyAndVisible()
        
//        var nav = UINavigationController()
//        var mainWiew = ViewController(nibName: nil, bundle: nil)
//        nav.viewControllers = [mainWiew]
//        nav.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.whiteColor()]
//        
//        UINavigationBar.appearance().barTintColor = UIColor.blueColor()
//        UINavigationBar.appearance().tintColor = UIColor.whiteColor()
//        
//        //White status font
//        UINavigationBar.appearance().barStyle = UIBarStyle.BlackTranslucent
//        
//        self.window!.rootViewController = nav
//        self.window?.makeKeyAndVisible()
//        
//        //Black status background
//        var statusBar = UIView()
//        statusBar.frame = CGRectMake(0, 0, 320, 20)
//        statusBar.backgroundColor = UIColor.blackColor()
//        self.window?.rootViewController?.view.addSubview(statusBar)
        
        //Setup Parse
        Parse.enableLocalDatastore()
        Parse.setApplicationId("o3bRoOmKK99gRMW3niQOV3SG39pl8y4XFwP4t77J", clientKey: "xeW88DhJFjBBokqetSZoiFnnfiBsF5ZtvQCQZoHQ")
        
        //Setup GoogleMaps
        GMSServices.provideAPIKey("AIzaSyAEeOQyFIVY8XFl5ViqeWbLJPsJy3Lrmig")
        
        return true
    }

}

extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "dismissKeyboard")
        view.addGestureRecognizer(tap)
    }
    
    func dismissKeyboard() {
        view.endEditing(true)
    }
}

