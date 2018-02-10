//
//  UIManager.swift
//  SimpleClock
//
//  Created by 今治 美里 on 2018/02/03.
//  Copyright © 2018年 misato.imaji. All rights reserved.
//

import Foundation
import UIKit

class UIManager {
    
    func setDefaultPulldown(view: UITextField) {
        view.backgroundColor = .clear
        view.layer.borderColor = themeColorSub.cgColor
        view.layer.borderWidth = 1
        view.layer.cornerRadius = 0
        view.textColor = themeColorSub
        view.textAlignment = .center
    }
}
