//
//  College.swift
//  College Profile Builder
//
//  Created by rziolkowski on 1/20/16.
//  Copyright © 2016 rziolkowski. All rights reserved.
//

import UIKit

class College: NSObject {
    var name = ""
    var location = ""
    var numberOfStudents = 0
    var image = UIImage(named: "Default")
    var webpage = ""
    
    convenience init(name: String, location: String, numberOfStudents: Int, image: UIImage, webpage: String)
    {
        self.init()
        self.name = name
        self.location = location
        self.numberOfStudents = numberOfStudents
        self.image = image
        self.webpage = webpage
    }
}
