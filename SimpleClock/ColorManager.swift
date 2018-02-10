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
    func setThemeColor(color: UIColor) {
        themeColor = color
    }
    
    func setThemeColorSub(color: UIColor) {
        themeColorSub = color
    }
}
