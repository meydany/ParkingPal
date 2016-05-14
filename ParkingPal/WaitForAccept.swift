//
//  WaitForAccept.swift
//  ParkingPal
//
//  Created by Oran Luzon on 5/14/16.
//  Copyright © 2016 AtomHacks. All rights reserved.
//

import UIKit
import CoreLocation
import GoogleMaps
import FlatUIKit

class WaitForAccept: UIViewController{
    
    var timer: NSTimer!
    var name: String!
    
    override func viewDidLoad() {
        timer = NSTimer.scheduledTimerWithTimeInterval(0.5, target: self, selector: Selector("check"), userInfo: nil, repeats: true)
        
        timer.fire()
    }
    
    func check(){
        DBManager.isRequestAccepted(name) { (result) in
            if (result){
                print("TRUE")
            }
            else{
                print("FALSE")
            }
        }
    }
    
}