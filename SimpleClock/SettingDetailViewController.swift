//
//  SettingDetailViewController.swift
//  SimpleClock
//
//  Created by 今治 美里 on 2018/02/10.
//  Copyright © 2018年 misato.imaji. All rights reserved.
//

import Foundation
import UIKit

class SettingDetailViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var selectedItem: String = ""
    var dataArray: [String] = []
    var beforeValue: String = ""
    
    @IBOutlet weak var tblSettingDetail: UITableView!
    override func viewDidLoad() {
        print(selectedItem)

        self.view.backgroundColor = themeColor

        tblSettingDetail.delegate = self
        tblSettingDetail.dataSource = self
        
        if selectedItem == "Color" {
            beforeValue = UserDefaults.standard.string(forKey: "Color")!
        } else if selectedItem == "Font" {
            beforeValue = UserDefaults.standard.string(forKey: "Font")!
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tblSettingDetail.reloadData()
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tblSettingDetail.dequeueReusableCell(withIdentifier: "SettingDetailCell",
                                                  for: indexPath)
        cell.backgroundColor = .clear
        
        cell.textLabel?.text = dataArray[indexPath.row]
        cell.textLabel?.textColor = themeColorSub
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if selectedItem == "Color" {
            UserDefaults.standard.set(dataArray[indexPath.row], forKey: "Color")
            UserDefaults.standard.synchronize()
        } else if selectedItem == "Font" {
            UserDefaults.standard.set(dataArray[indexPath.row], forKey: "Font")
            UserDefaults.standard.synchronize()
        }
    }
}
