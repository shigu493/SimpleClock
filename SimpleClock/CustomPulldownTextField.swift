//
//  CustomPulldownTextField.swift
//  SimpleClock
//
//  Created by 今治 美里 on 2018/02/03.
//  Copyright © 2018年 misato.imaji. All rights reserved.
//

import Foundation
import UIKit

class CustomPulldownTextField: UITextField, UIPickerViewDelegate, UIPickerViewDataSource {
    
    var dataList = [[String]]()

    func setup(dataList: [[String]]) {
        self.dataList = dataList
        
        let picker = UIPickerView()
        picker.delegate = self
        picker.dataSource = self
        picker.showsSelectionIndicator = true
        
        let toolbar = UIToolbar(frame: CGRect(x: 0, y: 0, width: 320, height: 40))
        let doneItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(done))
        let cancelItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(cancel))
        toolbar.setItems([cancelItem, doneItem], animated: true)
        
        self.inputView = picker
        self.inputAccessoryView = toolbar
    }
    
    @objc func cancel() {
        self.text = ""
        self.endEditing(true)
    }
    
    @objc func done() {
        self.endEditing(true)
    }
    
    // 列の数
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    // 行の数
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return dataList[pickerView.tag].count
    }
    
    // 値を表示
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return dataList[pickerView.tag][row]
    }
    
    // 値を選択
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        print("値が選択されたよ")
        switch pickerView.tag {
        case 1: // Color
            print(pickerView.tag)
            ColorManager().setThemeColor(color: .black)
            break
        case 2: // Font
            // aaa
            break
        default:
            // aaa
            break
        }
    }
    
    // 入力カーソル非表示
    override func caretRect(for position: UITextPosition) -> CGRect {
        return CGRect.zero
    }
    // 範囲選択カーソル非表示
    override func selectionRects(for range: UITextRange) -> [Any] {
        return []
    }
    
    // コピー・ペースト・選択等のメニュー非表示
    override func canPerformAction(_ action: Selector, withSender sender: Any?) -> Bool {
        return false
    }
}
