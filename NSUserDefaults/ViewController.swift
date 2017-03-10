//
//  ViewController.swift
//  NSUserDefaults
//
//  Created by Peter Zaporowski on 10.03.2017.
//  Copyright © 2017 Peter Zaporowski. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var colorLbl: UILabel!
    
    var people = [Person]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        if let color = NSUserDefaults.standardUserDefaults().valueForKey("color") as? String {
            colorLbl.text = "Favourite color: \(color)"
        } else {
            colorLbl.text = "Pick a color!"
        }
        
        let personA = Person(first: "Peter", last: "Zaporowski")
        let personB = Person(first: "Homer", last: "Simpson")
        let personC = Person(first: "Elliot", last: "Alderson")
        
        people.append(personA)
        people.append(personB)
        people.append(personC)
        
        let peopleData = NSKeyedArchiver.archivedDataWithRootObject(people) //archive and set the data to people Array
        
        NSUserDefaults.standardUserDefaults().setObject(peopleData, forKey: "people")
        NSUserDefaults.standardUserDefaults().synchronize()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func blueBtn(sender: AnyObject) {
        colorLbl.text = "Favourite Color: Blue"
        NSUserDefaults.standardUserDefaults().setValue("Blue", forKey: "color")
        NSUserDefaults.standardUserDefaults().synchronize()
        
        if let loadedPeople = NSUserDefaults.standardUserDefaults().objectForKey("people") as? NSData { //data
            
            if let peopleArray = NSKeyedUnarchiver.unarchiveObjectWithData(loadedPeople) as? [Person]{ //unarchiving Person array
                
                
                for person in peopleArray {
                    print(person.firstName)
                }
            }
        }
    }

    @IBAction func yellowBtn(sender: AnyObject) {
        colorLbl.text = "Favourite Color: Yellow"
        NSUserDefaults.standardUserDefaults().setValue("Yellow", forKey: "color")
        NSUserDefaults.standardUserDefaults().synchronize()
    }
    
    @IBAction func redBtn(sender: AnyObject) {
        colorLbl.text = "Favourite Color: Red"
        NSUserDefaults.standardUserDefaults().setValue("Red", forKey: "color")
        NSUserDefaults.standardUserDefaults().synchronize()
    }
    
}