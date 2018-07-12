//
//  ViewController.swift
//  ConvertIt
//
//  Created by Zhengyang Duan on 2018-07-03.
//  Copyright © 2018 Zhengyang Duan. All rights reserved.
//

import UIKit

struct CellData {
    let image: UIImage?
    let message: String?
}

class IndexViewController: UITableViewController{
    
    var data = [CellData]()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        data = [CellData.init(image: #imageLiteral(resourceName: "scale"), message: "Weight")]
        self.tableView.register(CustomCell.self, forCellReuseIdentifier: "custom")
        
        self.tableView.separatorStyle = .none
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "custom") as! CustomCell
        cell.customImage = data[indexPath.row].image
        cell.customMessage = data[indexPath.row].message
        return cell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }


}

