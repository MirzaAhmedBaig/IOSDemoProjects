//
//  ViewController.swift
//  Menu Bar
//
//  Created by Mirza Ahmed Baig on 30/04/18.
//  Copyright © 2018 Avantari. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func camerButtonClicked(_ sender: UIBarButtonItem) {
        print("Camera Button pressed")
    }
    
}
