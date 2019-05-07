//
//  Log.swift
//  internshiplog
//
//  Created by Michael Behrens on 5/7/19.
//  Copyright © 2019 Michael Behrens. All rights reserved.
//

import UIKit

class Log {
    
    var date: Date
    var company: String
    var rating: Int
    var description: String
    
    init(date: Date, company: String, rating: Int, description: String) {
        self.date = date
        self.company = company
        self.rating = rating
        self.description = description
    }
    
}
