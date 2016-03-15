//
//  ColorTheme.swift
//  Dine
//
//  Created by Yi Huang on 16/3/14.
//  Copyright © 2016年 YYZ. All rights reserved.
//

import Foundation
import UIKit
import ChameleonFramework

class ColorTheme {
    static var sharedInstance = ColorTheme()
    var loginGradientFisrtColor: UIColor
    var loginGradientSecondColor: UIColor
    var loginTextColor: UIColor
    
    init() {
        loginGradientFisrtColor = UIColor.flatWatermelonColor()
        loginGradientSecondColor = UIColor.flatRedColorDark()
        loginTextColor = ContrastColorOf(loginGradientFisrtColor, returnFlat: true)
        
    }



}