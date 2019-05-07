//
//  Colors.swift
//  internshiplog
//
//  Created by Michael Behrens on 5/7/19.
//  Copyright © 2019 Michael Behrens. All rights reserved.
//

import UIKit

class Colors {
    static let main = UIColor(red: 0/255, green: 120/255, blue: 186/255, alpha: 1.0)
    static let lightGray = UIColor(red: 240/255, green: 240/255, blue: 240/255, alpha: 1.0)
    
    static let customYellow = UIColor(red: 242/255, green: 189/255, blue: 0/255, alpha: 1.0)
    static let customRed = UIColor(red: 232/255, green: 0/255, blue: 3/255, alpha: 1.0)
    static let customOrange = UIColor(red: 237/255, green: 130/255, blue: 0/255, alpha: 1.0)
    static let customGreen = UIColor(red: 58/255, green: 196/255, blue: 0/255, alpha: 1.0)
    static let customBlue = UIColor(red: 0/255, green: 196/255, blue: 196/255, alpha: 1.0)
    static let customPurple = UIColor(red: 115/255, green: 0/255, blue: 168/255, alpha: 1.0)
    static let customPink = UIColor(red: 204/255, green: 0/255, blue: 166/255, alpha: 1.0)
    
    static func randomColor() -> UIColor {
        let num = Int.random(in: 0 ... 6)
        switch num {
        case 0:
            return customYellow
        case 1:
            return customRed
        case 2:
            return customOrange
        case 3:
            return customGreen
        case 4:
            return customBlue
        case 5:
            return customPurple
        case 6:
            return customPink
        default:
            return .white
        }
    }
    
}
