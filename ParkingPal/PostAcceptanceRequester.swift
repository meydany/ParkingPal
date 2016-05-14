//
//  PostAcceptanceRequester.swift
//  ParkingPal
//
//  Created by Oran Luzon on 5/14/16.
//  Copyright © 2016 AtomHacks. All rights reserved.
//

import Foundation
import UIKit
import ChameleonFramework

class PostAcceptanceRequester: UIViewController{
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.whiteColor()

        let headerLabel = UILabel(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height/6))
        headerLabel.textAlignment = NSTextAlignment.Center
        headerLabel.center = CGPoint(x: self.view.frame.width/2, y: self.view.frame.height*0.2)
        headerLabel.text = "Get on driving!"
        headerLabel.font = UIFont(name: "Quicksand-Light", size: 30 * ScreenRatios.screenWidthRatio)
        headerLabel.textColor = FlatWatermelon()
        
        
        self.view.addSubview(headerLabel)
        
        
        addNavbar()
        addPointsLabel()
        addBackButton()
    }
    
}