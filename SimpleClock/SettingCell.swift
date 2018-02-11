//
//  SettingCell.swift
//  SimpleClock
//
//  Created by 今治 美里 on 2018/02/12.
//  Copyright © 2018年 misato.imaji. All rights reserved.
//

import Foundation
import UIKit

class SettingCell: UITableViewCell {
    
    @IBOutlet weak var lblText: UILabel!
    @IBOutlet weak var scValue: UISegmentedControl!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
