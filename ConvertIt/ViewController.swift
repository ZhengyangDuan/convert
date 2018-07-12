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
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
    }


}

