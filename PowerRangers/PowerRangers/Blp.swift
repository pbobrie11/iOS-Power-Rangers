//
//  blp.swift
//  PowerRangers
//
//  Created by Zack on 11/20/15.
//  Copyright © 2015 Tommy. All rights reserved.
//

import UIKit

class Blp {
    
    //MARK: Properties
    
    var name: String
    var location: String
    var track: String
    var phoneNum: String
    var email: String
    var role: String
    var interests: String
    var housing: String
    var photo: String
    var lastName: String
    var identifier: String
    var nextLocation: String
    
    //MARK: Initialization
    
    init? (name:String, location: String, track: String, phoneNum: String, email: String, role: String, interests: String, housing: String, photo: String, lastName: String, identifier: String, nextLocation: String) {
        
        //Initialize stored values
        
        self.name = name
        self.location = location
        self.track = track
        self.phoneNum = phoneNum
        self.email = email
        self.role = role
        self.interests = interests
        self.housing = housing
        self.photo = photo
        self.lastName = lastName
        self.identifier = identifier
        self.nextLocation = nextLocation
        
        
        //initalizer to check if there is no name or rating is negative
        
        
    }
}
