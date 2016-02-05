//
//  College.swift
//  College Table View
//
//  Created by dforsyth on 1/25/16.
//  Copyright © 2016 dforsyth. All rights reserved.
//

import UIKit

class College: NSObject {
    var name = ""
    var state = ""
    var population = 0
    var webpage = ""
    var image = UIImage(named: "Default")
    
    convenience init(name: String, state: String, population: Int, image: UIImage, webpage: String) {
        self.init()
        self.name = name
        self.state = state
        self.population = population
        self.image = image
        self.webpage = webpage
    }
    
    convenience init(name: String) {
        self.init()
        self.name = name
    }
}
