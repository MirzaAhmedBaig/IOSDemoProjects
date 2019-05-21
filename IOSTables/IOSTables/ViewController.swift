//
//  ViewController.swift
//  IOSTables
//
//  Created by Mirza Ahmed Baig on 03/05/18.
//  Copyright © 2018 MAB. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet var table: UITableView!
    @IBOutlet var slider: UISlider!
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 50
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "Cell")
        if(slider.value >= 0.05){
            cell.textLabel?.text = String(Int(slider.value*20) * (indexPath.row+1))
        }else{
            cell.textLabel?.text = String(indexPath.row+1)
        }
        
        return cell
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onSliderChanged(_ sender: UISlider) {
        if(sender.value >= 0.05){
            table.reloadData()
        }
    }
    
}

