//
//  WeightController.swift
//  ConvertIt
//
//  Created by Zhengyang Duan on 2018-07-12.
//  Copyright © 2018 Zhengyang Duan. All rights reserved.
//

import Foundation
import UIKit

class WeightController: UIViewController, UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate{
    
    
    @IBOutlet weak var fromview: UITableView!
    @IBOutlet weak var toview: UITableView!
    @IBOutlet weak var fromBtn: UIButton!
    @IBOutlet weak var toBtn: UIButton!
    @IBOutlet weak var inputField: UITextField!
    @IBOutlet weak var result: UILabel!
    
    
    var measurements = ["kg", "lb", "oz"]
    var temp: Double = 0.00
    var target: Double = 0.00
    
    override func viewDidLoad(){
        super.viewDidLoad()
        fromview.delegate = self
        fromview.dataSource = self
        toview.dataSource = self
        toview.delegate = self
        fromview.isHidden = true
        toview.isHidden = true
        inputField.delegate = self
        fromview.separatorStyle = .none
        toview.separatorStyle = .none
        
    }

    //delegate method
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return measurements.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = measurements[indexPath.row]
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if tableView.tag == 1{
            fromBtn.setTitle(tableView.cellForRow(at: indexPath)?.textLabel?.text, for:[])
            tableView.isHidden = true
        }else if tableView.tag == 2{
            toBtn.setTitle(tableView.cellForRow(at: indexPath)?.textLabel?.text, for: [])
            tableView.isHidden = true
        }
        
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    @IBAction func frompressed(_ sender: UIButton) {
        fromview.isHidden = false
    }
    @IBAction func topressed(_ sender: Any) {
        toview.isHidden = false
    }
    
    @IBAction func convertPressed(_ sender: Any) {
        if !((fromBtn.titleLabel?.text)!=="select") && !((toBtn.titleLabel?.text)!=="select"){
            let answer = convert(source: (fromBtn.titleLabel?.text)!, to: (toBtn.titleLabel?.text)!)
            result.text = "\(round(answer*100)/100)" + (toBtn.titleLabel?.text!)!
        }
        

    }
    
    func convert(source: String, to: String) -> Double{
        var target:Double = 0.0
        if let from:Double = Double(inputField.text!){
            switch source {
            case "kg": temp = from
            case "lb": temp = from * (1/2.2046226218)
            case "oz": temp = (from/16)*(1/2.2046226218)
            default: result.text = "please select measurement"
            }
            switch to{
            case "kg": target = temp
            case "lb": target = temp * 2.2046226218
            case "oz": target = temp * 2.2046226218 * 16
            default: result.text = "please select measurement"
            }
        }
       return target
    }
}
