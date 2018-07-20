//
//  NumeralController.swift
//  ConvertIt
//
//  Created by Zhengyang Duan on 2018-07-20.
//  Copyright © 2018 Zhengyang Duan. All rights reserved.
//

import Foundation
import UIKit

class NumeralController: UIViewController, UITextFieldDelegate{
    
    
    @IBOutlet weak var numeral: UILabel!
    
    @IBOutlet weak var inputField: UITextField!
    @IBOutlet weak var numeralSwitch: UISwitch!
    
    @IBOutlet weak var result: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        numeralSwitch.isOn = false
        
    }
    // MARK: - text field delegate method
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
        inputField.delegate = self
        inputField.textAlignment = .center
        result.textAlignment = .center
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    // MARK: - UIaction method
    @IBAction func switchActivated(_ sender: UISwitch) {
        if numeral.text == "Roman to Arabic" {
            numeral.text = "Arabic to Roman"
        }else if numeral.text == "Arabic to Roman" {
            numeral.text = "Roman to Arabic"
        }
    }
    
    @IBAction func convertPressed(_ sender: UIButton) {
        if numeral.text == "Roman to Arabic" {
            result.text = "\(romanToInt("\(inputField.text!)"))"
        }else if numeral.text == "Arabic to Roman"{
            result.text = "\(intToRoman(Int(inputField.text!)!))"
        }
        
        
    }
    
    
    func romanToInt(_ s: String) -> Int {
        var res = 0
        let dict: [Character : Int] =
            ["I" : 1, "V" : 5, "X" : 10, "L" : 50, "C" : 100, "D" : 500, "M" : 1000]
        
        let sArr = Array(s)
        
        for i in 0..<sArr.count {
            
            if i - 1 >= 0 , dict[sArr[i]]! > dict[sArr[i - 1]]! {
                res += dict[sArr[i]]! - (2 * dict[sArr[i - 1]]!)
            } else {
                res += dict[sArr[i]]!
            }
        }
        return res
    }
    
    func intToRoman(_ number: Int) -> String {
        var M = ["","M","MM","MMM"]
        var C = ["","C","CC","CCC","CD","D","DC","DCC","DCCC","CM"]
        var X = ["","X","XX","XXX","XL","L","LX","LXX","LXXX","XC"]
        var I = ["","I","II","III","IV","V","VI","VII","VIII","IX"]
        let s:String = M[number/1000] + C[(number%1000)/100] + X[(number%100)/10] + I[number%10]
        return s
    }
    
    
}
