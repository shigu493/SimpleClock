//
//  ClockViewController.swift
//  SimpleClock
//
//  Created by 今治 美里 on 2018/01/21.
//  Copyright © 2018年 misato.imaji. All rights reserved.
//

import UIKit

class ClockViewController: UIViewController {
    
    @IBOutlet weak var lblTime: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // タイマーをセット
        let timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(displayClock), userInfo: nil, repeats: true)
        // 発火
        timer.fire()
        
        lblTime.font = UIFont(name: "Toma Slab", size: 50)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
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
}
