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
        
        lblTime.font = UIFont(name: "Toma Slab", size: 50)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc func displayClock() {
        // 現在時刻を「HH:MM:SS」形式で取得する
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm:ss"
        let displayTime = formatter.string(from: Date())    // Date()だけで現在時刻を表す
        lblTime.text = displayTime
    }
    
    @IBAction func tapBtnSetting(_ sender: Any) {
//        performSegue(withIdentifier: "ClockToSettingSegue", sender: nil)

    }
    
    // MARK: - delegate
    // 編集用モーダルからの戻り
    func returnFromSettingVC() {

    }
}
