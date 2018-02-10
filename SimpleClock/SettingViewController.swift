//
//  SettingViewController.swift
//  SimpleClock
//
//  Created by 今治 美里 on 2018/01/28.
//  Copyright © 2018年 misato.imaji. All rights reserved.
//

import UIKit
import FontAwesomeKit

class SettingViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var btnClose: UIButton!
    @IBOutlet weak var tblSetting: UITableView!
    let settingsLabelArray: [String] = ["Color", "Font"]
    let settingsColorArray: [String] = ["White", "Black"]
    let settingsFontArray: [String] = ["AAAA", "BBBB", "CCCC"]

    var selectedItem: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.view.backgroundColor = themeColor
        
        let closeIcon = FAKFontAwesome.closeIcon(withSize: 40)
        btnClose.titleLabel?.textColor = themeColorSub
        btnClose.titleLabel?.font = closeIcon?.iconFont()
        btnClose.setAttributedTitle(closeIcon?.attributedString(), for: .normal)
        
        tblSetting.delegate = self
        tblSetting.dataSource = self
        
        tblSetting.reloadData()
    }
    
    // MARK: - UIButton
    @IBAction func tapCloseBtn(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    // MARK: - UITableView
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return settingsLabelArray.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44.0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tblSetting.dequeueReusableCell(withIdentifier: "SettingCell",
                                                  for: indexPath)
        cell.backgroundColor = .clear
        
        // ラベル
        cell.textLabel?.text = settingsLabelArray[indexPath.row]
        cell.textLabel?.textColor = themeColorSub
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("タップされたよ")
        selectedItem = settingsLabelArray[indexPath.row]
    }
    
    // MARK: - Segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "SettingToDetail" {
            let settingDetailVC = segue.destination as! SettingDetailViewController
            settingDetailVC.selectedItem = selectedItem
            settingDetailVC.dataArray = ["White", "Black"]
            print(settingDetailVC.selectedItem)
        }
    }
}
