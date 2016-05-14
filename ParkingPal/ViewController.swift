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
import FlatUIKit

public struct ScreenRatios {
    static var screenWidth = UIScreen.mainScreen().bounds.size.width
    static var screenWidthRatio = screenWidth/375
    
    static var screenHeight = UIScreen.mainScreen().bounds.size.height
    static var screenHeightRatio = screenHeight/667
    
    static var screenRatio = screenWidth/screenHeight
}

class ViewController: UIViewController, UINavigationBarDelegate {
    
    var navigationBar: UINavigationBar!
    var navController: UINavigationController!
    
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
        
//        var navbar = UINavigationBar(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height))
//        
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
        
//        navigationBar = UINavigationBar(frame: CGRectMake(0, 0, self.view.frame.size.width, 44)) // Offset by 20 pixels vertically to take the status bar into account
//        
//        navigationBar.backgroundColor = UIColor.whiteColor()
//        navigationBar.delegate = self;
//        
//        // Create a navigation item with a title
//        let navigationItem = UINavigationItem()
//        navigationItem.title = "Title"
//        
//        // Create left and right button for navigation item
//        let leftButton =  UIBarButtonItem(title: "Save", style:   UIBarButtonItemStyle.Plain, target: self, action: "leftButton")
//        let rightButton = UIBarButtonItem(title: "Right", style: UIBarButtonItemStyle.Plain, target: self, action: nil)
//        
//        // Create two buttons for the navigation item
//        navigationItem.leftBarButtonItem = leftButton
//        navigationItem.rightBarButtonItem = rightButton
//        
//        // Assign the navigation item to the navigation bar
//        navigationBar.items = [navigationItem]
//        
//        //[UIBarButtonItem configureFlatButtonsWithColor:[UIColor peterRiverColor]
//            //highlightedColor:[UIColor belizeHoleColor]
//            //cornerRadius:3
//            //whenContainedIn:[YourViewController class]];
//        UIBarButtonItem.configureFlatButtonsWithColor(UIColor.peterRiverColor(), highlightedColor: UIColor.belizeHoleColor(), cornerRadius: 3)
//        // Make the navigation bar a subview of the current view controller
//        self.view.addSubview(navigationBar)
//        
//        navController = UINavigationController(rootViewController: self)
//        
        //view.addSubview((self.navigationController?.navigationBar)!)
        
        NSUserDefaults().setInteger(100, forKey: "points")
        
        view.addSubview(HomeView(frame: self.view.frame))
        addPointsLabel()
    }
    
    override func prefersStatusBarHidden() -> Bool {
        return true
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

extension UIViewController{
    func addPointsLabel(){
        let points = BasicLabel(frame: self.view.frame , text: "\(NSUserDefaults().integerForKey("points"))", fontSize: 25, color: UIColor.blackColor() , position: CGPoint(x: self.view.frame.width * 9/10, y: self.view.frame.height/23))
        
        view.addSubview(points)
    }
}
