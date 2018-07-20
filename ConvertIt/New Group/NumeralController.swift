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
    
    @IBOutlet weak var result: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
    }
    
    @IBAction func convertPressed(_ sender: UIButton) {
        if numeral.text == "Roman to Arabic" {
            result.text = "\(romanToInt("\(inputField.text!)"))"
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
    
}
