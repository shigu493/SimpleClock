//
//  ClockViewController.swift
//  SimpleClock
//
//  Created by 今治 美里 on 2018/01/21.
//  Copyright © 2018年 misato.imaji. All rights reserved.
//

import UIKit
import FontAwesomeKit

class ClockViewController: UIViewController {
    
    @IBOutlet weak var lblTime: UILabel!
    @IBOutlet weak var lblDate: UILabel!
    @IBOutlet weak var btnSetting: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // タイマーをセット
        let timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(displayClock), userInfo: nil, repeats: true)
        // 発火
        timer.fire()
        
        self.view.backgroundColor = themeColor
        
        let settingIcon = FAKFontAwesome.cogIcon(withSize: 40)
        btnSetting.titleLabel?.font = settingIcon?.iconFont()
        btnSetting.titleLabel?.textColor = themeColorSub
        btnSetting.setAttributedTitle(settingIcon?.attributedString(), for: .normal)
        
        var font: String = ""
        if UserDefaults.standard.string(forKey: "Font") != nil {
            font = UserDefaults.standard.object(forKey: "Font") as! String
        } else {
            font = "Toma Slab"
        }
        lblTime.font = UIFont(name: font, size: 50)
        lblTime.textColor = themeColorSub
        
        lblDate.font = UIFont(name: font, size: 20)
        lblDate.textColor = themeColorSub
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /// 日時を表示する
    @objc func displayClock() {
        // 時間
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm:ss"
        let time = formatter.string(from: Date())
        
        // 日付
        formatter.dateFormat = "yyyy/MM/dd"
        var date = formatter.string(from: Date()) + " "
        
        // 曜日
        var calendar = Calendar.current
        calendar.locale = Locale(identifier: "en")
        let weekday = calendar.component(.weekday, from: Date())
        let weekdaySymbols = calendar.shortWeekdaySymbols
        date += weekdaySymbols[weekday]
    
        // 時間、日付＋曜日をセット
        lblTime.text = time
        lblDate.text = date
    }
    
    @IBAction func tapBtnSetting(_ sender: Any) {
        
    }
}
