//
//  ColorManager.swift
//  SimpleClock
//
//  Created by 今治 美里 on 2018/02/03.
//  Copyright © 2018年 misato.imaji. All rights reserved.
//

import Foundation
import UIKit

var themeColor: UIColor = .black
var themeColorSub: UIColor = .white

class ColorManager {
    func setThemeColor(color: String) {
        if color == "Black" {
            themeColor = .black
            themeColorSub = .white
        } else if color == "DarkGray" {
            themeColor = .white
            themeColorSub = .darkGray
        } else if color == "LightGray" {
            themeColor = .white
            themeColorSub = .lightGray
        } else if color == "White" {
            themeColor = .white
            themeColorSub = .black
        }
    }
}
