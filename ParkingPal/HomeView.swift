//
//  HomeView.swift
//  ParkingPal
//
//  Created by Yoli Meydan on 5/13/16.
//  Copyright © 2016 AtomHacks. All rights reserved.
//

import Foundation
import UIKit
import Parse
import Bolts
import FlatUIKit
import ChameleonFramework
import GoogleMaps
import JVFloatLabeledTextField

class HomeView: UIView, GMSMapViewDelegate {
    
    var mapView: GMSMapView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let parkButton = FUIButton(frame: CGRect(x: self.frame.width/2 - self.frame.width*0.75/2, y: self.frame.height/2.3, width: self.frame.width*0.75, height: self.frame.height/5))
        
        DBManager.removeRequest("Hhhhhhhh")
        DBManager.removeUser("Yolk")
        parkButton.buttonColor = FlatSkyBlue()
        parkButton.shadowColor = FlatSkyBlueDark()
        parkButton.shadowHeight = 4;
        parkButton.cornerRadius = 6.0;
        parkButton.setTitle("PARK", forState: UIControlState.Normal)
        parkButton.setTitleColor(UIColor.cloudsColor(), forState: UIControlState.Normal)
        parkButton.titleLabel!.font = UIFont(name: "Quicksand-Light", size: 75 * ScreenRatios.screenWidthRatio)
        parkButton.addTarget(self, action: "onParkClick", forControlEvents: .TouchUpInside)
        
        let unParkButton = FUIButton(frame: CGRect(x: self.frame.width/2 - self.frame.width*0.75/2, y: 2*self.frame.height/3, width: self.frame.width*0.75, height: self.frame.height/5))
        unParkButton.buttonColor = FlatWatermelon()
        unParkButton.shadowColor = FlatWatermelonDark()
        unParkButton.shadowHeight = 4;
        unParkButton.cornerRadius = 6.0;
        unParkButton.setTitle("UN-PARK", forState: UIControlState.Normal)
        unParkButton.setTitleColor(UIColor.cloudsColor(), forState: UIControlState.Normal)
        unParkButton.titleLabel!.font = UIFont(name: "Quicksand-Light", size: 50 * ScreenRatios.screenWidthRatio)
        unParkButton.addTarget(self, action: "onUnParkClick", forControlEvents: .TouchUpInside)
        
        let titleLabelLeft = UILabel(frame: CGRect(x: self.frame.width/8, y: self.frame.height/10, width: self.frame.width, height: self.frame.height/10))
        titleLabelLeft.text = "PARKING"
        titleLabelLeft.font = UIFont(name: "Quicksand-Light", size: 67 * ScreenRatios.screenWidthRatio)
        titleLabelLeft.textColor = FlatSkyBlue()
        let titleLabelRight = UILabel(frame: CGRect(x: self.frame.width/8, y: self.frame.height/10 + titleLabelLeft.frame.height, width: self.frame.width, height: self.frame.height/10))
        titleLabelRight.text = "Pal"
        titleLabelRight.font = UIFont(name: "Quicksand-Light", size: 75 * ScreenRatios.screenWidthRatio)
        titleLabelRight.textColor = FlatWatermelon()
        
        self.addSubview(titleLabelLeft)
        self.addSubview(titleLabelRight)
        
        self.addSubview(parkButton)
        self.addSubview(unParkButton)
    }

    
    func onParkClick() {
        if(UserLocation.currentLocation != nil) {
            //DBManager.addUser("Yoli", location: UserLocation.currentLocation!, time: 10, price: 10)
            print("Location: \(UserLocation.currentLocation!)")
            print("Address: \(UserLocation.locationAddress!)")
            print("got here")
            UserLocation.getAddress(UserLocation.currentLocation!, completion: { (result) in
                print(result)
            })
            (UIApplication.sharedApplication().keyWindow?.rootViewController)!.presentViewController(MapView(), animated: true, completion: nil)
        }
        //(UIApplication.sharedApplication().keyWindow?.rootViewController)!.presentViewController(MapView(), animated: true, completion: nil)
    }
    
    func onUnParkClick() {
        if(UserLocation.currentLocation != nil) {
           (UIApplication.sharedApplication().keyWindow?.rootViewController)!.presentViewController(UnparkFormView(), animated: true, completion: nil)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
