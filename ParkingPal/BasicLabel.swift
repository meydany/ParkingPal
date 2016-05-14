//
//  BasicLabel.swift
//  ParkingPal
//
//  Created by Oran Luzon on 5/14/16.
//  Copyright © 2016 AtomHacks. All rights reserved.
//

import Foundation
import UIKit

class BasicLabel: UILabel {
    init(frame: CGRect, text: String, fontSize: Int!, color: UIColor, position: CGPoint) {
        super.init(frame: CGRectMake(0,0,0,0))
        
        self.text = text
        self.textAlignment = NSTextAlignment.Center
        self.textColor = color
        self.font = UIFont(name: "DINCondensed-Bold", size: CGFloat(fontSize) * ScreenRatios.screenWidthRatio)
        self.center = CGPoint(x: position.x - (self.intrinsicContentSize().width/2), y: position.y)
        self.sizeToFit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}