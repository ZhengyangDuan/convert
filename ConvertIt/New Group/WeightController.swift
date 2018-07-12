//
//  WeightController.swift
//  ConvertIt
//
//  Created by Zhengyang Duan on 2018-07-12.
//  Copyright © 2018 Zhengyang Duan. All rights reserved.
//

import Foundation
import UIKit

class WeightController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    
    @IBOutlet weak var fromview: UITableView!
    @IBOutlet weak var toview: UITableView!
    @IBOutlet weak var fromBtn: UIButton!
    @IBOutlet weak var toBtn: UIButton!
    var measurements = ["kg", "lb", "oz"]
    
    override func viewDidLoad(){
        super.viewDidLoad()
        fromview.delegate = self
        fromview.dataSource = self
        toview.dataSource = self
        toview.delegate = self
        fromview.isHidden = true
        toview.isHidden = true
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
            fromBtn.titleLabel?.text = tableView.cellForRow(at: indexPath)?.textLabel?.text
        }else if tableView.tag == 2{
            toBtn.titleLabel?.text = tableView.cellForRow(at: indexPath)?.textLabel?.text
        }
        tableView.isHidden = true
    }
    
    @IBAction func frompressed(_ sender: UIButton) {
        fromview.isHidden = false
    }
    @IBAction func topressed(_ sender: Any) {
        toview.isHidden = false
    }
}
