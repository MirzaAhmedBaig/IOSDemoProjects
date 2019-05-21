//
//  ViewController.swift
//  CoreDataDemo
//
//  Created by Mirza Ahmed Baig on 19/05/18.
//  Copyright © 2018 MAB. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    @IBOutlet var userName: UITextField!
    @IBOutlet var loginButton: UIButton!
    @IBOutlet var helloMessage: UILabel!
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    @IBOutlet var imageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        loadImage()
        let context = appDelegate.persistentContainer.viewContext
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "User")
        request.returnsDistinctResults = false
        do {
            let result = try context.fetch(request)
            if result.count > 0 {
                userName.isHidden = true
                loginButton.isHidden = true
                let name = (result.first as! NSManagedObject).value(forKey: "username") as! String
                helloMessage.text = "Hello \(name)"
            }
        }catch{
            
        }
    }
    @IBAction func logOut(_ sender: Any) {
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "User")
    }
    
    @IBAction func updateUserName(_ sender: Any) {
        
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    
    }

   
    @IBAction func onLogin(_ sender: UIButton) {
//        if let userNameText = userName.text as String {
//        guard let userNameText = userName.text as String, let guessedCount = String(userNameText) else{
//            return
//        }
        if let userNameText = userName.text{
            print("Hello \(userNameText)")
        }
            let context = appDelegate.persistentContainer.viewContext
            let newUser = NSEntityDescription.insertNewObject(forEntityName: "User", into: context)
        
            newUser.setValue(String(userName.text!), forKey: "username")
            do{
                try context.save()
                print("Saved")
                userName.isHidden = true
                loginButton.isHidden = true
                helloMessage.text = "Hello \(String(userName.text!))"
            }catch{
                print("Exception")
            }
            
            
//        }else{
//            print("Please enter username")
//        }
    }
    
    private func loadImage(){
        do{
//            try imageView.image = UIImage(data: Data(contentsOf: URL(string: "https://fossbytes.com/wp-content/uploads/2018/05/yanny.jpg")!))
            let savePath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
            try imageView.image = UIImage(data: Data(contentsOf: URL(fileURLWithPath: savePath[0] + "/newImage.jeg")))
//            if(savePath.count>0){
//                try UIImageJPEGRepresentation(imageView.image!, 1)?.write(to: URL(fileURLWithPath: savePath[0] + "/newImage.jeg"))
//            }
        }catch{}
        
    }
    
}

