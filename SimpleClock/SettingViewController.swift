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
    let settingsColorArray: [String] = ["White", "LightGray", "DarkGray", "Black"]
    let settingsFontArray: [String] = ["Toma Slab", "Molot", "Qikki Reg", "azuki_font", "ibaraji", "CP_Revenge"]

    var selectedItem: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let closeIcon = FAKFontAwesome.closeIcon(withSize: 40)
        btnClose.titleLabel?.font = closeIcon?.iconFont()
        btnClose.setAttributedTitle(closeIcon?.attributedString(), for: .normal)
        
        tblSetting.delegate = self
        tblSetting.dataSource = self
        
        setColor()
    }
    
    func setColor() {
        self.view.backgroundColor = themeColor
        btnClose.titleLabel?.textColor = themeColorSub
        tblSetting.reloadData()
    }
    
    // MARK: - UIButton
    /// 閉じるボタン押下
    ///
    /// - Parameter sender: UIButton
    @IBAction func tapCloseBtn(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    // MARK: - UITableView
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return settingsLabelArray.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 85.0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tblSetting.dequeueReusableCell(withIdentifier: "SettingCell",
                                                  for: indexPath) as! SettingCell
        cell.backgroundColor = .clear

        // ラベル
        cell.lblText.text = settingsLabelArray[indexPath.row]
        cell.lblText.textColor = themeColorSub
        
        // 値
        if indexPath.row == 0 { // Color
            cell.scValue.changeAllSegmentWithArray(arr: settingsColorArray, type: "Color")
        } else if indexPath.row == 1 { // Font
            cell.scValue.changeAllSegmentWithArray(arr: settingsFontArray, type: "Font")
        }
        cell.scValue.tag = indexPath.row
        cell.scValue.tintColor = themeColorSub
        return cell
    }
    
    // MARK: - UISegmentedControl
    /// SegmentedControlの値が変更されたときに呼ばれる
    ///
    /// - Parameter sender: UISegmentedControl
    @IBAction func changeValue(_ sender: UISegmentedControl) {
        switch sender.tag {
        case 0: // Color
            UserDefaults.standard.set(settingsColorArray[sender.selectedSegmentIndex], forKey: "Color")
            ColorManager().setThemeColor(color: settingsColorArray[sender.selectedSegmentIndex])
            setColor()

        case 1: // Font
            UserDefaults.standard.set(settingsFontArray[sender.selectedSegmentIndex], forKey: "Font")
            
        default:
            return
        }
    }
}

extension UISegmentedControl {
    
    /// SegmentedControlのすべての要素の入れ替え
    ///
    /// - Parameters:
    ///   - arr: 要素の配列
    ///   - type: 要素の種別
    func changeAllSegmentWithArray(arr: [String], type: String) {
        var defaultValue = 0
        self.removeAllSegments()
        for str in arr {
            self.insertSegment(withTitle: str, at: self.numberOfSegments, animated: false)
            if UserDefaults.standard.string(forKey: type) != nil
                && str == UserDefaults.standard.string(forKey: type) {
                defaultValue = self.numberOfSegments - 1
            }
        }
        self.selectedSegmentIndex = defaultValue
    }
    
}
