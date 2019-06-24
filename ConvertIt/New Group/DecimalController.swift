//
//  DecimalController.swift
//  ConvertIt
//
//  Created by Zhengyang Duan on 2018-07-23.
//  Copyright © 2018 Zhengyang Duan. All rights reserved.
//

import Foundation
import UIKit

class DecimalViewController: UIViewController {
    
    
    @IBOutlet weak var inputField: UITextField!
    @IBOutlet weak var result: UILabel!
    var resultValue = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    @IBAction func binToDecTapped(_ sender: UIButton) {
        resultValue = 0
        if Int(inputField.text!) != nil {
            var temp = Int(inputField.text!)!
            var i = 0
            while temp != 0 {
                resultValue += (temp % 10) * Int(pow(2.00, Double(i)))
                i += 1
                temp = (temp - (temp%10))/10
            }
            result.text = "\(resultValue)"
            
        }
        
    }
    
    @IBAction func decToBinTapped(_ sender: UIButton) {
        resultValue = 0
        if Int(inputField.text!) != nil {
            var temp = Int(inputField.text!)!
            var i:[Int] = []
            while temp != 0 {
                i.insert(temp%2, at: 0)
                temp/=2
            }
            var s = ""
            for num in 0..<i.count{
                s = s + "\(i[num])"
            }
            result.text = s
            
        }
    }
    
}

extension DecimalViewController: UITextFieldDelegate {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
        inputField.delegate = self
        inputField.textAlignment = .center
        inputField.textAlignment = .center
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        inputField.resignFirstResponder()
        return true
    }
    
}

