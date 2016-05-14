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

class UnparkFormView: UIViewController {
    
    var headerLabel: UILabel!
    
    var nameField: FUITextField!
    var locationField: FUITextField!
    var timeField: FUITextField!
    var priceField: FUITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.whiteColor()
        
        headerLabel = UILabel(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height/8))
        headerLabel.textAlignment = NSTextAlignment.Center
        headerLabel.center = CGPoint(x: self.view.frame.width/2, y: self.view.frame.height/10)
        headerLabel.text = "UN-PARK"
        headerLabel.font = UIFont(name: "Quicksand-Light", size: 70 * ScreenRatios.screenWidthRatio)
        headerLabel.textColor = FlatWatermelon()
        
        nameField = FUITextField(frame: CGRect(x: 0, y: 0, width: 3*self.view.frame.width/4, height: self.view.frame.height/10))
        nameField.center = CGPoint(x: self.view.frame.width/2, y: self.view.frame.height*0.4)
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
        
        timeField = FUITextField(frame: CGRect(x: 0, y: 0, width: 3*self.view.frame.width/4, height: self.view.frame.height/10))
        timeField.center = CGPoint(x: self.view.frame.width/2, y: self.view.frame.height*0.6)
        timeField.placeholder = "Minimum time"
        timeField.backgroundColor = UIColor.clearColor()
        timeField.edgeInsets = UIEdgeInsetsMake(4, 15, 4, 15)
        timeField.textFieldColor = UIColor.whiteColor()
        timeField.borderColor = FlatWatermelonDark()
        timeField.borderWidth = 2
        timeField.cornerRadius = 3
        
        priceField = FUITextField(frame: CGRect(x: 0, y: 0, width: 3*self.view.frame.width/4, height: self.view.frame.height/10))
        priceField.center = CGPoint(x: self.view.frame.width/2, y: self.view.frame.height*0.7)
        priceField.placeholder = "Minimum Price"
        priceField.backgroundColor = UIColor.clearColor()
        priceField.edgeInsets = UIEdgeInsetsMake(4, 15, 4, 15)
        priceField.textFieldColor = UIColor.whiteColor()
        priceField.borderColor = FlatWatermelonDark()
        priceField.borderWidth = 2
        priceField.cornerRadius = 3
        
        self.view.addSubview(headerLabel)
        self.view.addSubview(locationField)
        self.view.addSubview(timeField)
        self.view.addSubview(priceField)
        self.view.addSubview(nameField)
    }
    
}
