//
//  SecondViewController.swift
//  ToDoApp
//
//  Created by Mirza Ahmed Baig on 11/05/18.
//  Copyright © 2018 MAB. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet var itemText: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onAddCliced(_ sender: UIButton) {
        if(itemText.text != nil && !(itemText.text?.isEmpty)!){
            
            let itemsObject = UserDefaults.standard.object(forKey: "items")
            var items:[String]
            if let isItems = itemsObject as? [String] {
                items = isItems
                items.append(itemText.text!)
            }else{
                items = [itemText.text!]
            }
            UserDefaults.standard.set(items, forKey: "items")
            
//            let text:String = itemText.text!
//            (self.tabBarController?.viewControllers![0] as! FirstViewController).addItemToList(item: text)
            itemText.text = ""
        }else{
            let alertView = UIAlertController(title: "Empty...!", message: "Please Insert item", preferredStyle: UIAlertControllerStyle.alert)
            alertView.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
            self.present(alertView, animated: true, completion: nil)
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
}

