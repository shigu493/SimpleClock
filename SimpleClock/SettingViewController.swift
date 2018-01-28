//
//  SettingViewController.swift
//  SimpleClock
//
//  Created by 今治 美里 on 2018/01/28.
//  Copyright © 2018年 misato.imaji. All rights reserved.
//

import UIKit
import FontAwesomeKit

class SettingViewController: UIViewController {
    
    @IBOutlet weak var btnClose: UIButton!
    
    override func viewDidLoad() {
        let closeIcon = FAKFontAwesome.closeIcon(withSize: 40)
        btnClose.titleLabel?.font = closeIcon?.iconFont()
        btnClose.setAttributedTitle(closeIcon?.attributedString(), for: .normal)
    }
    
    @IBAction func tapCloseBtn(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
