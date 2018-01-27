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
        // Do any additional setup after loading the view, typically from a nib.
        lblTime.font = UIFont(name: "Toma Slab", size: 50)
        
    }

    override func viewWillAppear(_ animated: Bool) {

    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

