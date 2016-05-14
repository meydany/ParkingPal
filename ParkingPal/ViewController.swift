//
//  ViewController.swift
//  ParkingPal
//
//  Created by Yoli Meydan on 5/13/16.
//  Copyright © 2016 AtomHacks. All rights reserved.
//

import UIKit
import CoreLocation
import GoogleMaps

public struct ScreenRatios {
    static var screenWidth = UIScreen.mainScreen().bounds.size.width
    static var screenWidthRatio = screenWidth/375
    
    static var screenHeight = UIScreen.mainScreen().bounds.size.height
    static var screenHeightRatio = screenHeight/667
    
    static var screenRatio = screenWidth/screenHeight
}

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //NSDictionary *attrs = @{NSForegroundColorAttributeName: [UIColor whiteColor]};
        
        //[[UIBarItem appearance] setTitleTextAttributes:attrs
            //forState:UIControlStateNormal];
//        [UIBarButtonItem configureFlatButtonsWithColor:[UIColor peterRiverColor]
//            highlightedColor:[UIColor belizeHoleColor]
//            cornerRadius:3
//            whenContainedIn:[UINavigationBar class], nil];
//        
//        self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Plain Table"
//        style:UIBarButtonItemStylePlain
//        target:self
//        action:@selector(showPlainTableView:)];
//        [self.navigationItem.rightBarButtonItem removeTitleShadow];
//        
//        self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Grouped Table"
//        style:UIBarButtonItemStylePlain
//        target:self
//        action:@selector(showTableView:)];
//        [self.navigationItem.leftBarButtonItem removeTitleShadow];
//        
//        [self.navigationItem.leftBarButtonItem configureFlatButtonWithColor:[UIColor alizarinColor]
//        highlightedColor:[UIColor pomegranateColor]
//        cornerRadius:3];
        
//        let attrs: NSDictionary = [NSForegroundColorAttributeName: UIColor.whiteColor()]
//        let appearance = UIBarItem().setTitleTextAttributes(attrs as? [String : AnyObject], forState: UIControlState.Normal)
//        
//        UIBarButtonItem.configureFlatButtonsWithColor(UIColor.peterRiverColor(), highlightedColor: UIColor.belizeHoleColor(), cornerRadius: 3)
//        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Next", style: .Plain, target: self, action: "rightButton")
//        self.navigationItem.rightBarButtonItem?.removeTitleShadow()
//        
//        //UIBarButtonItem.configureFlatButtonsWithColor(UIColor.peterRiverColor(), highlightedColor: UIColor.belizeHoleColor(), cornerRadius: 3)
//        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Back", style: .Plain, target: self, action: "leftButton")
//        self.navigationItem.leftBarButtonItem?.removeTitleShadow()
//        
//        self.navigationItem.leftBarButtonItem?.configureFlatButtonWithColor(UIColor.alizarinColor(), highlightedColor: UIColor.pomegranateColor(), cornerRadius: 3)
//        
//        self.navigationController?.navigationBar.configureFlatNavigationBarWithColor(UIColor.flatBlueColor())
//        
//        var nc = UINavigationController(rootViewController: self).popToViewController(self, animated: false)
        
        view.addSubview(HomeView(frame: self.view.frame))
    }
    
    func rightButton(){
    
    }
    
    func leftButton(){
    
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

