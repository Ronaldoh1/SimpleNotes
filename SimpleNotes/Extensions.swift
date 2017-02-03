//
//  Extensions.swift
//  SimpleNotes
//
//  Created by Ronald Hernandez on 2/3/17.
//  Copyright © 2017 Ronaldoh1. All rights reserved.
//

import UIKit

extension UIColor {

    static func rgb(red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat? = 1) -> UIColor {
        return UIColor(red: red/255, green: green/255, blue: blue/255, alpha: alpha ?? 1)
    }
    
}
