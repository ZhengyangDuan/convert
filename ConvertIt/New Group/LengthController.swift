//
//  LengthController.swift
//  ConvertIt
//
//  Created by Zhengyang Duan on 2018-07-20.
//  Copyright © 2018 Zhengyang Duan. All rights reserved.
//

import Foundation
import UIKit

class LengthController: UIViewController {
    
    
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var lengthResult: UILabel!
    @IBOutlet weak var lengthPicker: UIPickerView!
    let dataSource = [["Meter","Kilometer","CM","Inch","Feet","Yard","Mile"],["to"],["Meter","Kilometer","CM","Inch","Feet","Yard","Mile"]]
    var temp: Double = 0.00
    var result: Double = 0.00
    override func viewDidLoad() {
        super.viewDidLoad()
        lengthPicker.delegate = self
        lengthPicker.dataSource = self
        
    }
    
    @IBAction func buttonPressed(_ sender: UIBarButtonItem) {
        lengthResult.text = "\(round(result*10000)/10000)"
    }
    
    
    
    
}

extension LengthController: UIPickerViewDelegate,UIPickerViewDataSource{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return dataSource.count
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return dataSource[component].count
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        if let num: Double = Double(textField.text!) {
            if component == 0 {
                switch row {
                case 0:
                    temp = num
                case 1:
                    temp = num/1000
                case 2:
                    temp = num * 100
                case 3:
                    temp = num * 0.0254
                case 4:
                    temp = num * 0.3048
                case 5:
                    temp = num * 0.9144
                case 6:
                    temp = num * 1609.34
                default:
                    break
                }
            }else if component == 2{
                switch row {
                case 0:
                    result = temp
                case 1:
                    result = temp * 1000
                case 2:
                    result = temp / 100
                case 3:
                    result = temp / 0.0254
                case 4:
                    result = temp / 0.3048
                case 5:
                    result = temp / 0.9144
                case 6:
                    result = temp / 1609.34
                default:
                    break
                }
            }
        }
        
        
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return dataSource[component][row] 
    }
    
    
}

extension LengthController: UITextFieldDelegate {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
        textField.delegate = self
        textField.textAlignment = .center
        textField.textAlignment = .center
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
}
