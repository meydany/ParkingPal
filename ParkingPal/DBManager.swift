//
//  DBManager.swift
//  ParkingPal
//
//  Created by Yoli Meydan on 5/14/16.
//  Copyright © 2016 AtomHacks. All rights reserved.
//

import Foundation
import Parse
import Bolts

class DBManager {
    
    static func addUser(name: String, location: CLLocationCoordinate2D, time: Int, price: Int) {
        
        let coordLocation = ["Longitude" : (location.longitude) as Double, "Latitude" : (location.latitude) as Double]
        
        let pfObject = PFObject(className: "Users")

        pfObject.setObject(name, forKey: "Name")
        pfObject.setObject(coordLocation, forKey: "Location")
        pfObject.setObject(time, forKey: "Time")
        pfObject.setObject(price, forKey: "Price")
        
        pfObject.saveInBackground()
    }
    
    static func removeUser(name: String) {
        let pfQuery = PFQuery(className: "Users")
        pfQuery.whereKey("Name", equalTo: name as AnyObject)
        pfQuery.findObjectsInBackgroundWithBlock {
            (objects:[PFObject]?, error:NSError?) -> Void in
            if error == nil {
                // The find succeeded.
                // Do something with the found objects
                if let objects = objects {
                    for object in objects {
                        object.deleteInBackground()
                    }
                }
            } else {
                // Log details of the failure
                print("Error: \(error!) \(error!.userInfo)")
            }
        }
    }
    
    static func getUser(name: String, completion:(result:(name: String, location: CLLocationCoordinate2D, time: Int, price: Int))->Void) {
        let pfQuery = PFQuery(className: "Users")
        pfQuery.whereKey("Name", equalTo: name as AnyObject)
        pfQuery.findObjectsInBackgroundWithBlock {
            (objects:[PFObject]?, error:NSError?) -> Void in
            if error == nil {
                // The find succeeded.
                // Do something with the found objects
                if let objects = objects {
                    for object in objects {
                        let coordLocation = CLLocationCoordinate2D(latitude: (object.objectForKey("Location") as! [String:Double])["Latitude"]!, longitude: (object.objectForKey("Location") as! [String:Double])["Longitude"]!)
                        completion(result: (object.objectForKey("Name") as! String, coordLocation, object.objectForKey("Time") as! Int, object.objectForKey("Price") as! Int))
                    }
                }
            } else {
                // Log details of the failure
                print("Error: \(error!) \(error!.userInfo)")
            }
        }
    }
    
    static func getAllUserNames(completion:(result: [String])->Void) {
        let pfQuery = PFQuery(className: "Users")
        pfQuery.whereKeyExists("Name")
        
        pfQuery.findObjectsInBackgroundWithBlock {
            (objects:[PFObject]?, error:NSError?) -> Void in
            if error == nil {
                // The find succeeded.
                // Do something with the found objects
                var nameArray: [String] = []
                if let objects = objects {
                    for object in objects {
                        nameArray.append(object.objectForKey("Name") as! String)
                    }
                }
                completion(result: nameArray)
            } else {
                // Log details of the failure
                print("Error: \(error!) \(error!.userInfo)")
            }
        }
    }
}