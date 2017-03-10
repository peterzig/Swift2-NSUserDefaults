//
//  Person.swift
//  NSUserDefaults
//
//  Created by Peter Zaporowski on 10.03.2017.
//  Copyright © 2017 Peter Zaporowski. All rights reserved.
//

import Foundation

class Person: NSObject, NSCoding { //Inheritance NSObject & NSCoding allows to use it in NSUserDefaults
    
    var firstName: String!
    var lastName: String!

    init(first:String, last:String){
        firstName = first
        lastName = last
    }
    
    override init(){ //overriding self.init to avoid errors
        
    }
    
    required convenience init?(coder aDecoder: NSCoder){
        self.init()
        self.firstName = aDecoder.decodeObjectForKey("firstName") as? String
        self.lastName = aDecoder.decodeObjectForKey("lastName") as? String
    }
    
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(self.firstName, forKey: "firstName")
        aCoder.encodeObject(self.lastName, forKey: "lastName")
    }
}