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
        
        headerLabel = UILabel(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height/10))
        headerLabel.textAlignment = NSTextAlignment.Center
        headerLabel.center = CGPoint(x: self.view.frame.width/2, y: self.view.frame.height/10)
        headerLabel.text = "UN-PARK"
        headerLabel.font = UIFont(name: "Quicksand-Light", size: 70 * ScreenRatios.screenWidthRatio)
        headerLabel.textColor = FlatWatermelon()
        
        
        locationField = FUITextField(frame: CGRect(x: 0, y: 0, width: 3*self.view.frame.width/4, height: self.view.frame.height/10))
        locationField.center = CGPoint(x: self.view.frame.width/2, y: self.view.frame.height/2)
        locationField.placeholder = "Your Location"
        locationField.backgroundColor = UIColor.clearColor()
        locationField.edgeInsets = UIEdgeInsetsMake(4, 15, 4, 15)
        locationField.textFieldColor = UIColor.whiteColor()
        locationField.borderColor = FlatWatermelonDark()
        locationField.borderWidth = 2
        locationField.cornerRadius = 3
        
        self.view.addSubview(headerLabel)
        self.view.addSubview(locationField)
    }
    
}
