//
//  ViewController.swift
//  WeatherInfo
//
//  Created by Mirza Ahmed Baig on 15/05/18.
//  Copyright © 2018 MAB. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var backgroundImage: UIImageView!
    @IBOutlet var enteredCity: UITextField!
    @IBOutlet var resultText: UILabel!
    var imageArray = [#imageLiteral(resourceName: "weather1"), #imageLiteral(resourceName: "weather2"), #imageLiteral(resourceName: "weather3"), #imageLiteral(resourceName: "weather4")]
    override func viewDidLoad() {
        super.viewDidLoad()
        
        callWithAPI(cityName: "nanded")
        
        let random = Int(arc4random_uniform(UInt32(imageArray.count)))
        self.backgroundImage.image = imageArray[random]
        Timer.scheduledTimer(withTimeInterval: 5.0, repeats: true){
            _ in
            self.changeImage()
            
        }
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func onSubmitClicked(_ sender: UIButton) {
        
        
        if let cityName = enteredCity.text {
            callWithAPI(cityName: cityName)
        }else{
            print("please enter city name")
        }
        
//        let stringSaparator = "Weather Today </h2>(1&ndash;3 days)</span><p class=\"b-forecast__table-description-content\"><span class=\"phrase\">"
//        let subStringSaparater = "</span></p></td><td colspan=\"9\">"
//        if let cityName = enteredCity.text{
//            if let url = URL(string: "https://www.weather-forecast.com/locations/\(cityName)/forecasts/latest"){
//                do{
//                    let contents = try String(contentsOf: url)
//                    let separatedArray = contents.components(separatedBy: stringSaparator)
//                    if separatedArray.count>0{
//                        resultText.text = separatedArray[1].components(separatedBy: subStringSaparater)[0]
//                    }
//                }catch{
//                    print("Exceptiion occur")
//                }
//            }
//        }else{
//            print("Please Enter city")
//        }
        
    }
    
    private func changeImage(){
        DispatchQueue.main.async {
            let random = Int(arc4random_uniform(UInt32(self.imageArray.count)))
            UIView.transition(with: self.backgroundImage,
                              duration:1.0,
                              options: .transitionCrossDissolve,
                              animations: { self.backgroundImage.image = self.imageArray[random] },
                              completion: nil)
        }
        
    }
    
    private func callWithAPI(cityName:String){
        
        if let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?q=\(cityName)&appid=0c1c4673b427400062764bf06312284f"){
            
            let task = URLSession.shared.dataTask(with: url){
                (data, response, error) in
                if(error != nil){
                    print(error!)
                }else{
                    if((response as! HTTPURLResponse).statusCode==404){
                        print("City not found")
                    }else{
                        do {
                            let jsonResult = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers) as AnyObject
                            if let description = ((jsonResult["weather"] as? NSArray)?[0] as? NSDictionary)?["description"] as? String {
                                
                                self.resultText.text = description
                                let task = URLSessionTask.with
                                
                            }
                            
                            
                        }catch{
                            
                        }
                    }
                }
                print((response as! HTTPURLResponse).statusCode)
                print(error as Any)
            }
            task.resume()
            
            
            
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

